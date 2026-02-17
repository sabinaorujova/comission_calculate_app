import '../../../../core/utils/user_history_tracker.dart';
import '../entities/transaction_entity.dart';
import 'commission_rule_factory.dart';

class CalculateCommissionUseCase {
  final UserHistoryTracker tracker;

  CalculateCommissionUseCase({required this.tracker});

  double execute(TransactionEntity transaction) {
    final strategy = CommissionRuleFactory.getStrategy(transaction);
    return strategy.calculate(transaction, tracker);
  }
}
