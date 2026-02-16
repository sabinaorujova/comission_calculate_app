
import '../../../../core/enums/user_type.dart';
import '../../../../core/utils/user_history_tracker.dart';
import '../rules/business_withdrawal_rule.dart';
import '../rules/comission_rule.dart';
import '../rules/deposite_rule.dart';
import '../rules/private_rule.dart';
import '../entities/transaction_entity.dart';

class CalculateCommissionUseCase {
  final UserHistoryTracker tracker;

  final ComissionRule _depositStrategy = DepositeRule();
  final ComissionRule _businessStrategy = BusinessWithdrawalRule();
  final ComissionRule _privateStrategy = PrivateWithdrawalRule();

  CalculateCommissionUseCase({required this.tracker});


  double execute(TransactionEntity transaction) {
    ComissionRule strategy = _getStrategy(transaction);
    return strategy.calculate(transaction, tracker);
  }

  ComissionRule _getStrategy(TransactionEntity transaction) {
    if (transaction.operationType == OperationType.deposit) {
      return _depositStrategy;
    } else if (transaction.userType == UserType.business) {
      return _businessStrategy;
    } else {
      return _privateStrategy;
    }
  }
}
