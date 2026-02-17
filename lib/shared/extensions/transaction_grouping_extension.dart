import 'package:intl/intl.dart';
import '../../features/home/domain/entities/comission_result.dart';

extension TransactionGrouping on List<CommissionResult> {
  Map<String, List<CommissionResult>> groupByWeek() {
    final Map<String, List<CommissionResult>> groups = {};

    for (var result in this) {

      final DateTime date = result.transaction.date; 
      
      final monday = _getMonday(date);
      final weekHeader = "Week of ${DateFormat('dd MMM, yyyy').format(monday)}";

      if (!groups.containsKey(weekHeader)) {
        groups[weekHeader] = [];
      }
      groups[weekHeader]!.add(result);
    }
    return groups;
  }

  DateTime _getMonday(DateTime date) {
    int daysToSubtract = date.weekday - DateTime.monday;
    return DateTime(date.year, date.month, date.day).subtract(Duration(days: daysToSubtract));
  }
}