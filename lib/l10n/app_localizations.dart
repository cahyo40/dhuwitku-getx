import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Dhuwitku'**
  String get app_name;

  /// No description provided for @personal_finance.
  ///
  /// In en, this message translates to:
  /// **'Personal Finance'**
  String get personal_finance;

  /// No description provided for @onboard_title_1.
  ///
  /// In en, this message translates to:
  /// **'Control Your Money, Clearly'**
  String get onboard_title_1;

  /// No description provided for @onboard_description_1.
  ///
  /// In en, this message translates to:
  /// **'Track your income and expenses effortlessly with a clean, distraction-free interface designed for clarity and focus.'**
  String get onboard_description_1;

  /// No description provided for @onboard_cta_1.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboard_cta_1;

  /// No description provided for @onboard_title_2.
  ///
  /// In en, this message translates to:
  /// **'Collaborate Without Confusion'**
  String get onboard_title_2;

  /// No description provided for @onboard_description_2.
  ///
  /// In en, this message translates to:
  /// **'Manage shared finances for events, projects, or teams with transparent collaboration and real-time sync.'**
  String get onboard_description_2;

  /// No description provided for @onboard_cta_2.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboard_cta_2;

  /// No description provided for @onboard_title_3.
  ///
  /// In en, this message translates to:
  /// **'Works Even When You’re Offline'**
  String get onboard_title_3;

  /// No description provided for @onboard_description_3.
  ///
  /// In en, this message translates to:
  /// **'Add and review transactions anytime. Your data syncs automatically once you’re back online.'**
  String get onboard_description_3;

  /// No description provided for @onboard_cta_3.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get onboard_cta_3;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'One account. All your financial data.'**
  String get login_subtitle;

  /// No description provided for @login_cta.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get login_cta;

  /// No description provided for @login_terms.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms of Service and Privacy Policy.'**
  String get login_terms;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @good_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get good_morning;

  /// No description provided for @good_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get good_afternoon;

  /// No description provided for @good_evening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get good_evening;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello {name}'**
  String hello(String name);

  /// No description provided for @total_balance.
  ///
  /// In en, this message translates to:
  /// **'Total Balance'**
  String get total_balance;

  /// No description provided for @last_month.
  ///
  /// In en, this message translates to:
  /// **'{data}% from last month'**
  String last_month(String data);

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @this_month.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get this_month;

  /// No description provided for @recent_transaction.
  ///
  /// In en, this message translates to:
  /// **'Recent Transaction'**
  String get recent_transaction;

  /// No description provided for @active_budget.
  ///
  /// In en, this message translates to:
  /// **'Active Budget'**
  String get active_budget;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @transaction_list.
  ///
  /// In en, this message translates to:
  /// **'Transaction List'**
  String get transaction_list;

  /// No description provided for @error_title.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error_title;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @transaction_create.
  ///
  /// In en, this message translates to:
  /// **'Create Transaction'**
  String get transaction_create;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @title_no_category.
  ///
  /// In en, this message translates to:
  /// **'No Category Yet'**
  String get title_no_category;

  /// No description provided for @desc_no_category.
  ///
  /// In en, this message translates to:
  /// **'Add a category to organize your transactions.'**
  String get desc_no_category;

  /// No description provided for @add_category.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get add_category;

  /// No description provided for @save_transaction.
  ///
  /// In en, this message translates to:
  /// **'Save Transaction'**
  String get save_transaction;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @hint_input_title.
  ///
  /// In en, this message translates to:
  /// **'Enter transaction title'**
  String get hint_input_title;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @hint_input_amount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get hint_input_amount;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @hint_select_category.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get hint_select_category;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @hint_select_date.
  ///
  /// In en, this message translates to:
  /// **'Select a date'**
  String get hint_select_date;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @hint_input_description.
  ///
  /// In en, this message translates to:
  /// **'Enter description (optional)'**
  String get hint_input_description;

  /// No description provided for @hint_select_budget.
  ///
  /// In en, this message translates to:
  /// **'Select a budget (optional)'**
  String get hint_select_budget;

  /// No description provided for @select_icon.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get select_icon;

  /// No description provided for @select_color.
  ///
  /// In en, this message translates to:
  /// **'Select Color'**
  String get select_color;

  /// No description provided for @hint_input_category.
  ///
  /// In en, this message translates to:
  /// **'Enter category name'**
  String get hint_input_category;

  /// No description provided for @save_category.
  ///
  /// In en, this message translates to:
  /// **'Save Category'**
  String get save_category;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
