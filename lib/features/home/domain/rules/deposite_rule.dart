import '../../../../core/utils/currency_helper.dart';
import '../../../../core/utils/user_history_tracker.dart';
import '../entities/transaction_entity.dart';
import 'comission_rule.dart';
class DepositeRule implements CommissionRule {
  @override
  double calculate(
      TransactionEntity transaction, UserHistoryTracker historyTracker) {
    double commission = (transaction.amount * 0.03) / 100; 
    
    return CurrencyHelper.roundUp(commission, transaction.currency);
  }
}