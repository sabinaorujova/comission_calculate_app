import 'package:get_it/get_it.dart';
import 'core/utils/user_history_tracker.dart';
import 'features/home/data/datasources/file_data_sources.dart';
import 'features/home/data/repositories/transaction_repo_impl.dart';
import 'features/home/domain/repository/transaction_repo.dart';
import 'features/home/domain/usecases/calculate_comission_usecase.dart';
import 'features/home/presentation/viewmodel/cubits/home_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => HomeCubit(
      repository: sl(),
      calculateCommission: sl(),
    ),
  );
  sl.registerLazySingleton(() => UserHistoryTracker());
  sl.registerLazySingleton(() => CalculateCommissionUseCase(tracker: sl()));

  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(dataSource: sl()),
  );

  sl.registerLazySingleton<FileDataSource>(
    () => CsvFileDataSource(),
  );
}
