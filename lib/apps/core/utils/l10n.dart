import 'package:dhuwitku/l10n/app_localizations.dart';
import 'package:get/get.dart';

class L10n {
  L10n._();
  static AppLocalizations get t {
    return AppLocalizations.of(Get.context!)!;
  }
}
