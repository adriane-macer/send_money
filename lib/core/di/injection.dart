import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(),
  );

  sl.registerLazySingleton(
        () => LoginUseCase(sl()),
  );

  sl.registerFactory(
        () => LoginCubit(sl()),
  );
}