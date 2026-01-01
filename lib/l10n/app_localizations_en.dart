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

  @override
  String get retry => 'Retry';

  @override
  String get good_morning => 'Good morning';

  @override
  String get good_afternoon => 'Good afternoon';

  @override
  String get good_evening => 'Good evening';

  @override
  String hello(String name) {
    return 'Hello $name';
  }

  @override
  String get total_balance => 'Total Balance';

  @override
  String last_month(String data) {
    return '$data% from last month';
  }

  @override
  String get income => 'Income';

  @override
  String get expense => 'Expense';

  @override
  String get this_month => 'This Month';

  @override
  String get recent_transaction => 'Recent Transaction';

  @override
  String get active_budget => 'Active Budget';

  @override
  String get all => 'All';

  @override
  String get transaction_list => 'Transaction List';

  @override
  String get error_title => 'Error';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get home => 'Home';

  @override
  String get transaction => 'Transaction';

  @override
  String get budget => 'Budget';

  @override
  String get report => 'Report';

  @override
  String get settings => 'Settings';

  @override
  String get transaction_create => 'Create Transaction';

  @override
  String get reset => 'Reset';

  @override
  String get title_no_category => 'No Category Yet';

  @override
  String get desc_no_category =>
      'Add a category to organize your transactions.';

  @override
  String get add_category => 'Add Category';

  @override
  String get save_transaction => 'Save Transaction';

  @override
  String get title => 'Title';

  @override
  String get hint_input_title => 'Enter transaction title';

  @override
  String get amount => 'Amount';

  @override
  String get hint_input_amount => 'Enter amount';

  @override
  String get category => 'Category';

  @override
  String get hint_select_category => 'Select a category';

  @override
  String get date => 'Date';

  @override
  String get hint_select_date => 'Select a date';

  @override
  String get description => 'Description';

  @override
  String get hint_input_description => 'Enter description (optional)';

  @override
  String get hint_select_budget => 'Select a budget (optional)';
}
