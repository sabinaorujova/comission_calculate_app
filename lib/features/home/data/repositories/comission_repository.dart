import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/comission_result.dart';
import '../../domain/repository/i_comission_repo.dart';

class CommissionRepository implements ICommissionRepository {

  @override
  Future<Either<Failure, List<CommissionResult>>> getCalculatedCommissions() async {
    try {
 
      final List<CommissionResult> results = []; 
      return Right(results);
    } catch (e) {
      return Left(CalculationFailure(" exception:${e.toString()}"));
    }
  }
}