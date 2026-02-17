import '../../../../core/utils/currency_helper.dart';
import '../../../../core/utils/user_history_tracker.dart';
import '../entities/transaction_entity.dart';
import 'comission_rule.dart';

class PrivateWithdrawalRule implements CommissionRule {
  @override
  double calculate(
    TransactionEntity transaction,
    UserHistoryTracker historyTracker,
  ) {
    double amountInEur = CurrencyHelper.convertToEur(
      transaction.amount,
      transaction.currency,
    );

    var history = historyTracker.getHistory(transaction.userId);

    bool isNewWeek = !isSameWeek(history.lastDate, transaction.date) &&
        history.lastDate.year != 0;

    double currentWeeklyTotal = isNewWeek ? 0 : history.weeklyTotalAmountInEur;
    int currentCount = isNewWeek ? 0 : history.weeklyTransactionCount;

    double commissionInEur = 0.0;

    if (currentCount >= 3) {
      commissionInEur = amountInEur * 0.003;
    } else {
      if (currentWeeklyTotal >= 1000) {
        commissionInEur = amountInEur * 0.003;
      } else {
        double remainingLimit = 1000 - currentWeeklyTotal;
        if (amountInEur > remainingLimit) {
          double taxableAmount = amountInEur - remainingLimit;
          commissionInEur = taxableAmount * 0.003;
        } else {
          commissionInEur = 0.0;
        }
      }
    }

    historyTracker.updateHistory(
      transaction.userId,
      transaction.date,
      amountInEur,
    );

    double commissionOriginal = 0;
    if (commissionInEur > 0) {
      commissionOriginal =
          CurrencyHelper.convertFromEur(commissionInEur, transaction.currency);
    }

    return CurrencyHelper.roundUp(commissionOriginal, transaction.currency);
  }

  bool isSameWeek(DateTime d1, DateTime d2) {
    DateTime m1 = d1.subtract(Duration(days: d1.weekday - 1));
    DateTime m2 = d2.subtract(Duration(days: d2.weekday - 1));
    return m1.year == m2.year && m1.month == m2.month && m1.day == m2.day;
  }
}
