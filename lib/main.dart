import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhuwitku/apps/binding/initial_bindings.dart';
import 'package:dhuwitku/apps/controller/language_controller.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/firebase_options.dart';
import 'package:dhuwitku/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yo_ui/yo_ui.dart';

import 'apps/routes/route_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  YoTextTheme.setFont(
    primary: YoFonts.inter,
    secondary: YoFonts.inter,
    mono: YoFonts.oswald,
  );

  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  InitialBindings().dependencies();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  await FirebaseMessaging.instance.requestPermission(provisional: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = Get.put(LanguageController(), permanent: true);
    YoDateFormatter.texts = l10n.isIndonesia
        ? DateTexts.indonesian
        : DateTexts.english;
    return GetMaterialApp(
      title: 'Dhuwitku',
      localizationsDelegates: const [
        AppLocalizations.delegate, // utama
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: l10n.locale,
      // fallback supaya tidak merah saja
      localeListResolutionCallback: (locales, supported) {
        for (final l in locales ?? []) {
          if (supported.contains(l)) return l;
        }
        return l10n.lang.value;
      },

      themeMode: ThemeMode.dark,
      theme: YoTheme.lightTheme(context, YoColorScheme.codingDark),
      darkTheme: YoTheme.darkTheme(context, YoColorScheme.codingDark),
      initialRoute: RouteNames.SPLASH_SCREEN,
      getPages: RouteApp.routes,
    );
  }
}
