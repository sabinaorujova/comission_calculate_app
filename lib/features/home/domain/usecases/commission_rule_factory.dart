import 'package:commssion_calculator/features/home/domain/rules/deposite_rule.dart';

import '../../../../core/enums/user_type.dart';
import '../entities/transaction_entity.dart';
import '../rules/business_withdrawal_rule.dart';
import '../rules/comission_rule.dart';
import '../rules/private_rule.dart';

class CommissionRuleFactory {
  static CommissionRule getStrategy(TransactionEntity transaction) {
    if (transaction.operationType == OperationType.deposit) {
      return DepositeRule();
    }

    return transaction.userType == UserType.business
        ? BusinessWithdrawalRule()
        : PrivateWithdrawalRule();
  }
}
