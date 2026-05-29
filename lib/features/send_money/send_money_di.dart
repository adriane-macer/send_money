import 'package:send_money/core/di/injection.dart';
import 'package:http/http.dart' as http;
import 'package:send_money/features/send_money/data/datasources/send_money_remote_datasource.dart';
import 'package:send_money/features/send_money/data/datasources/send_money_remote_datasource_impl.dart';
import 'package:send_money/features/send_money/data/repositories/send_money_repository_impl.dart';
import 'package:send_money/features/send_money/domain/repositories/send_money_repository.dart';
import 'package:send_money/features/send_money/domain/usecases/send_money_usecase.dart';
import 'package:send_money/features/send_money/presentation/cubit/send_money_cubit.dart';

void setupSendMoneyDI() {
  if (!sl.isRegistered<http.Client>()) {
    sl.registerLazySingleton(() => http.Client());
  }

  sl.registerLazySingleton<SendMoneyRemoteDataSource>(
    () => SendMoneyRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<SendMoneyRepository>(
    () => SendMoneyRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => SendMoneyUseCase(sl()));

  sl.registerFactory(() => SendMoneyCubit(sendMoneyUseCase: sl()));
}
