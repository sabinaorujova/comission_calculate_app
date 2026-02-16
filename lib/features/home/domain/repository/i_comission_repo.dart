import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../entities/comission_result.dart';

abstract class ICommissionRepository {
  Future<Either<Failure, List<CommissionResult>>> getCalculatedCommissions();
}