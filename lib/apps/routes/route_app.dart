import 'package:get/get.dart';

import '../features/activity/presentation/binding/activity_binding.dart';
import '../features/activity/presentation/view/activity_view.dart';
import '../features/bottom_nav_bar/presentation/binding/bottom_nav_bar_binding.dart';
import '../features/bottom_nav_bar/presentation/view/bottom_nav_bar_view.dart';
import '../features/budget/presentation/binding/budget_binding.dart';
import '../features/budget/presentation/view/budget_view.dart';
import '../features/home/presentation/controller/binding/home_binding.dart';
import '../features/home/presentation/view/home_view.dart';
import '../features/login/presentation/binding/login_binding.dart';
import '../features/login/presentation/view/login_view.dart';
import '../features/onboarding/presentation/binding/onboarding_binding.dart';
import '../features/onboarding/presentation/view/onboarding_view.dart';
import '../features/report/presentation/binding/report_binding.dart';
import '../features/report/presentation/view/report_view.dart';
import '../features/settings/presentation/binding/settings_binding.dart';
import '../features/settings/presentation/view/settings_view.dart';
import '../features/splash_screen/presentation/binding/splash_screen_binding.dart';
import '../features/splash_screen/presentation/view/splash_screen_view.dart';
import '../features/transaction/presentation/binding/transaction_binding.dart';
import '../features/transaction/presentation/view/transaction_view.dart';
import 'route_names.dart';

class RouteApp {
  static final routes = [
    GetPage(
      name: RouteNames.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteNames.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: RouteNames.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: RouteNames.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      bindings: [
        BottomNavBarBinding(),
        HomeBinding(),
        TransactionBinding(),
        BudgetBinding(),
        ReportBinding(),
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: RouteNames.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: RouteNames.BUDGET,
      page: () => const BudgetView(),
      binding: BudgetBinding(),
    ),
    GetPage(
      name: RouteNames.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: RouteNames.ACTIVITY,
      page: () => const ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: RouteNames.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
