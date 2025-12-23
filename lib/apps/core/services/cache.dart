import 'package:dhuwitku/apps/core/const/cache_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class YoCache {
  static final box = GetStorage();

  // Bahasa
  static String get locale => box.read(CacheConst.locale) ?? 'id_ID';
  static Future<void> saveLocale(String val) =>
      box.write(CacheConst.locale, val);

  // onboard
  static bool get onboard => box.read(CacheConst.onboard) ?? true;

  static Future<void> saveOnboard(bool val) =>
      box.write(CacheConst.onboard, val);

  // User
  static String get uid => box.read(CacheConst.uid) ?? '';
  static String get fcmToken => box.read(CacheConst.fcmToken) ?? '';
  static String get name => box.read(CacheConst.name) ?? '';
  static String get email => box.read(CacheConst.email) ?? '';
  static String get photoUrl => box.read(CacheConst.photoUrl) ?? '';

  static void saveUser(User user, String fcmToken) {
    box.write(CacheConst.uid, user.uid);
    box.write(CacheConst.fcmToken, fcmToken);
    box.write(CacheConst.name, user.displayName);
    box.write(CacheConst.email, user.email);
    box.write(CacheConst.photoUrl, user.photoURL);
  }

  static void removeUser() {
    box.write(CacheConst.uid, '');
    box.write(CacheConst.fcmToken, '');
    box.write(CacheConst.name, '');
    box.write(CacheConst.email, '');
    box.write(CacheConst.photoUrl, '');
  }
}
