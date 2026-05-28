import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:send_money/features/auth/domain/usecases/logout_usecase.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:send_money/features/send_money/data/datasources/send_money_remote_datasource.dart';
import 'package:send_money/features/send_money/data/datasources/send_money_remote_datasource_impl.dart';
import 'package:send_money/features/send_money/data/repositories/send_money_repository_impl.dart';
import 'package:send_money/features/send_money/domain/repositories/send_money_repository.dart';
import 'package:send_money/features/send_money/domain/usecases/send_money_usecase.dart';
import 'package:send_money/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  sl.registerLazySingleton(() => LoginUseCase(sl()));

  sl.registerFactory(() => LoginCubit(sl()));

  sl.registerFactory(() => WalletCubit());

  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  sl.registerFactory(() => AuthCubit(logoutUseCase: sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<SendMoneyRemoteDataSource>(
    () => SendMoneyRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<SendMoneyRepository>(
    () => SendMoneyRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => SendMoneyUseCase(sl()));

  sl.registerFactory(() => SendMoneyCubit(sendMoneyUseCase: sl()));
}
