
import '../../../../core/enums/user_type.dart';

class TransactionEntity {
  final DateTime date;
  final int userId;
  final UserType userType;
  final OperationType operationType;
  final double amount;
  final String currency;

  TransactionEntity({
    required this.date,
    required this.userId,
    required this.userType,
    required this.operationType,
    required this.amount,
    required this.currency,
  });
}