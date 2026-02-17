import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/currency_helper.dart';
import '../../../domain/entities/comission_result.dart';
import '../../../domain/repository/transaction_repo.dart';
import '../../../domain/usecases/calculate_comission_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TransactionRepository repository;
  final CalculateCommissionUseCase calculateCommission;

  HomeCubit({
    required this.repository,
    required this.calculateCommission,
  }) : super(HomeInitial());

  Future<void> loadAndCalculate() async {
    emit(HomeLoading());

    final result = await repository.getTransactions('assets/input.csv');

    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (transactions) {
        try {
          final List<CommissionResult> results = [];
          double totalCommissionInEur = 0; 

          for (var transaction in transactions) {
            final commission = calculateCommission.execute(transaction);

            results.add(CommissionResult(
              transaction: transaction,
              commission: commission,
            ));

            totalCommissionInEur += CurrencyHelper.convertToEur(
              commission, 
              transaction.currency
            );
          }

          emit(HomeLoaded(results, totalCommissionInEur));
        } catch (e) {
          emit(HomeError("Calculation Error: $e"));
        }
      },
    );
  }
}