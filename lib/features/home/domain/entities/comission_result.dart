import 'transaction_entity.dart';
class CommissionResult {
  final TransactionEntity transaction;
  final double commission;

  CommissionResult({required this.transaction, required this.commission});
}