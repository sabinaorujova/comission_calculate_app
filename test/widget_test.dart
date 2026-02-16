
import 'package:commssion_calculator/core/enums/user_type.dart';
import 'package:commssion_calculator/core/utils/user_history_tracker.dart';
import 'package:commssion_calculator/features/home/domain/entities/transaction_entity.dart';
import 'package:commssion_calculator/features/home/domain/rules/private_rule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PrivateWithdrawalRule rule;
  late UserHistoryTracker tracker;

  setUp(() {
    rule = PrivateWithdrawalRule();
    tracker = UserHistoryTracker();
  });

  group('PrivateWithdrawalRule Tests', () {
    test('should return 0.0 commission for the first 1000 EUR withdrawal', () {
      final transaction = TransactionEntity(
        date: DateTime(2016, 1, 1),
        userId: 1,
        userType: UserType.private,
        operationType: OperationType.withdraw,
        amount: 1000.0,
        currency: 'EUR',
      );

      final result = rule.calculate(transaction, tracker);

      expect(result, 0.0);
    });

    test('should charge 0.3% commission after exceeding the 1000 EUR weekly limit', () {
      final t1 = TransactionEntity(
        date: DateTime(2016, 1, 1),
        userId: 1,
        userType: UserType.private,
        operationType: OperationType.withdraw,
        amount: 1000.0,
        currency: 'EUR',
      );
      rule.calculate(t1, tracker);

      final t2 = TransactionEntity(
        date: DateTime(2016, 1, 2),
        userId: 1,
        userType: UserType.private,
        operationType: OperationType.withdraw,
        amount: 100.0,
        currency: 'EUR',
      );

      final result = rule.calculate(t2, tracker);

      expect(result, 0.3);
    });

    test('should charge commission after 3 free operations regardless of the amount limit', () {
      for (int i = 0; i < 3; i++) {
        rule.calculate(
          TransactionEntity(
            date: DateTime(2016, 1, 1),
            userId: 1,
            userType: UserType.private,
            operationType: OperationType.withdraw,
            amount: 10.0,
            currency: 'EUR',
          ),
          tracker,
        );
      }

      final t4 = TransactionEntity(
        date: DateTime(2016, 1, 1),
        userId: 1,
        userType: UserType.private,
        operationType: OperationType.withdraw,
        amount: 100.0,
        currency: 'EUR',
      );

      final result = rule.calculate(t4, tracker);
      expect(result, 0.3);
    });

    test('should handle JPY rounding and conversion correctly', () {
      final transaction = TransactionEntity(
        date: DateTime(2016, 1, 1),
        userId: 5,
        userType: UserType.private,
        operationType: OperationType.withdraw,
        amount: 3000000.0,
        currency: 'JPY',
      );

      final result = rule.calculate(transaction, tracker);
      
      expect(result % 1, 0); 
    });
  });
}