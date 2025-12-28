import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:intl/intl.dart';
import 'package:yo_ui/yo_ui.dart';

extension DateExtension on YoDateFormatter {
  String getDateHeaderTransaction(DateTime date) {
    final today = YoDateFormatter.isToday(date);
    final yesterday = YoDateFormatter.isYesterday(date);

    if (today) {
      return L10n.t.today;
    } else if (yesterday) {
      return "${L10n.t.yesterday}, ${DateFormat('dd MMM yyyy').format(date)}";
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }
}
