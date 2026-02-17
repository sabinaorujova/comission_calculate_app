import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/transaction_repo.dart';
import '../datasources/file_data_sources.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final FileDataSource dataSource;

  TransactionRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions(String filePath) async {
    try {
      final rawData = await dataSource.readCsv(filePath);
      final transactions = rawData.map((row) => TransactionModel.fromCsv(row)).toList();
      
      return Right(transactions); 
    } catch (e) {
      return Left(CalculationFailure("Error reading file: ${e.toString()}"));
    }
  }
}