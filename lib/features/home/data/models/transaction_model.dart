
import '../../../../core/enums/user_type.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.date,
    required super.userId,
    required super.userType,
    required super.operationType,
    required super.amount,
    required super.currency,
  });


  factory TransactionModel.fromCsv (List<dynamic>row){
    return TransactionModel(
      date: DateTime.parse(row[0] as String),
      userId: int.parse(row[1] as String),
      userType: UserType.fromString(row[2] as String),
      operationType: OperationType.fromString(row[3] as String),
      amount: double.parse(row[4] as String), 
      currency: row[5] as String,
    );
  }
  
  
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      date: DateTime.parse(json['date']),
      userId: json['user_id'],
      userType: UserType.fromString(json['user_type']),
      operationType: OperationType.fromString(json['operation_type']),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
    );
  }
}

