// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Dhuwitku';

  @override
  String get personal_finance => 'Personal Finance';

  @override
  String get onboard_title_1 => 'Control Your Money, Clearly';

  @override
  String get onboard_description_1 =>
      'Track your income and expenses effortlessly with a clean, distraction-free interface designed for clarity and focus.';

  @override
  String get onboard_cta_1 => 'Get Started';

  @override
  String get onboard_title_2 => 'Collaborate Without Confusion';

  @override
  String get onboard_description_2 =>
      'Manage shared finances for events, projects, or teams with transparent collaboration and real-time sync.';

  @override
  String get onboard_cta_2 => 'Continue';

  @override
  String get onboard_title_3 => 'Works Even When You’re Offline';

  @override
  String get onboard_description_3 =>
      'Add and review transactions anytime. Your data syncs automatically once you’re back online.';

  @override
  String get onboard_cta_3 => 'Sign in with Google';

  @override
  String get login_subtitle => 'One account. All your financial data.';

  @override
  String get login_cta => 'Continue with Google';

  @override
  String get login_terms =>
      'By continuing, you agree to our Terms of Service and Privacy Policy.';
}
