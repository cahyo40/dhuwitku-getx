import 'package:dhuwitku/apps/core/utils/l10n.dart';

class YoStringHelpers {
  static String transaction(String value) {
    switch (value) {
      case "all":
        return L10n.t.all;
      case "income":
        return L10n.t.income;
      case "expense":
        return L10n.t.expense;
      default:
        return value;
    }
  }
}
