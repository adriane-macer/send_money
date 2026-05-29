import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:send_money/features/auth/domain/repositories/auth_repository.dart';
import 'package:send_money/features/auth/domain/usecases/login_usecase.dart';
import 'package:send_money/features/auth/domain/usecases/logout_usecase.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';

import 'presentation/cubit/login_cubit.dart';

void setupAuthDI(){
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  sl.registerLazySingleton(() => LoginUseCase(sl()));

  sl.registerFactory(() => LoginCubit(sl()));

  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  sl.registerFactory(() => AuthCubit(logoutUseCase: sl()));
}