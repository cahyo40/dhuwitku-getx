import 'package:dhuwitku/apps/core/const/cache_const.dart';
import 'package:dhuwitku/apps/core/services/cache.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yo_ui/yo_ui_base.dart';

class AuthController extends GetxController {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static bool isInitialize = false;
  final Rxn<User> user = Rxn<User>();

  Stream<User?> get authChange {
    return _auth.authStateChanges();
  }

  String get email => YoCache.box.read(CacheConst.email);

  String get fcmToken => YoCache.box.read(CacheConst.fcmToken);

  bool get isLoggedIn => user.value != null;

  String get name => YoCache.box.read(CacheConst.name);

  String get photoUrl => YoCache.box.read(CacheConst.photoUrl);
  String get uid => YoCache.box.read(CacheConst.uid);
  @override
  void onInit() {
    final isOnboardingDone = YoCache.onboard;

    ever(user, (_) => _handleRouting());

    authChange.listen((u) => user.value = u);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isOnboardingDone == true) {
        Get.offAllNamed(RouteNames.ONBOARDING);
      } else {
        _handleRouting();
      }
    });

    super.onInit();
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      initSignIn();
      final GoogleSignInAccount gUser = await _googleSignIn.authenticate();
      final idToken = gUser.authentication.idToken;
      final authorizationClient = gUser.authorizationClient;

      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes(['email', 'profile']);
      final accessToken = authorization?.accessToken;

      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );
        if (authorization2?.accessToken == null) {
          throw FirebaseAuthException(code: "error", message: "error");
        }
        authorization = authorization2;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final fcm = await FirebaseMessaging.instance.getToken();

        YoCache.saveUser(user, fcm!);
      }
      return userCredential;
    } on PlatformException catch (e) {
      YoLogger.error(e.code);
      if (e.code == 'sign_in_canceled') return null;
      rethrow;
    } on GoogleSignInException catch (e, s) {
      YoLogger.error("$e -> $s");
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      YoCache.removeUser();
    } catch (e) {
      rethrow;
    }
  }

  void _handleRouting() {
    if (user.value != null) {
      Get.offAllNamed(RouteNames.BOTTOM_NAV_BAR);
    } else {
      Get.offAllNamed(RouteNames.LOGIN);
    }
  }

  static Future<void> initSignIn() async {
    await _googleSignIn.initialize(
      serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'] ?? '',
    );

    isInitialize = true;
  }
}
