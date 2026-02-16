
class UserHistory {
  DateTime lastDate;
  double weeklyTotalAmountInEur;
  int weeklyTransactionCount;

  UserHistory({
    required this.lastDate,
    this.weeklyTotalAmountInEur = 0.0,
    this.weeklyTransactionCount = 0,
  });
}

class UserHistoryTracker {
  final Map<int, UserHistory> _userHistory = {};

  void updateHistory(int userId, DateTime date, double amountInEur) {
    if (!_userHistory.containsKey(userId)) {
      _userHistory[userId] = UserHistory(lastDate: date);
    }

    var history = _userHistory[userId]!;

    if (!_isSameWeek(history.lastDate, date)) {
      history.weeklyTotalAmountInEur = 0;
      history.weeklyTransactionCount = 0;
    }

    history.lastDate = date;
    history.weeklyTotalAmountInEur += amountInEur;
    history.weeklyTransactionCount += 1;
  }
  
  UserHistory getHistory(int userId) {
      return _userHistory[userId] ?? UserHistory(lastDate: DateTime(0));
  }

  bool _isSameWeek(DateTime date1, DateTime date2) {
    DateTime monday1 = date1.subtract(Duration(days: date1.weekday - 1));
    DateTime monday2 = date2.subtract(Duration(days: date2.weekday - 1));
    
    return monday1.year == monday2.year && 
           monday1.month == monday2.month && 
           monday1.day == monday2.day;
  }
}