import 'package:dhuwitku/apps/core/utils/l10n.dart';

String getGreeting() {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour < 12) {
    return L10n.t.good_morning;
  } else if (hour < 18) {
    return L10n.t.good_afternoon;
  } else {
    return L10n.t.good_evening;
  }
}
