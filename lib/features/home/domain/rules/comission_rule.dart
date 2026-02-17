import '../../../../core/utils/user_history_tracker.dart';
import '../entities/transaction_entity.dart';

abstract class CommissionRule {
  double calculate(
      TransactionEntity transaction, UserHistoryTracker historyTracker);
}
