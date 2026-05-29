
import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/transactions/data/datasources/transaction_remote_datasource.dart';
import 'package:send_money/features/transactions/data/datasources/transaction_remote_datasource_impl.dart';
import 'package:send_money/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:send_money/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:send_money/features/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:http/http.dart' as http;

import 'presentation/cubit/transaction_cubit.dart';

void setupTransactionDI(){

  if(!sl.isRegistered<http.Client>()) {
    sl.registerLazySingleton(() => http.Client());
  }

  sl.registerLazySingleton<TransactionRemoteDataSource>(
        () => TransactionRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<TransactionRepository>(
        () => TransactionRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => GetTransactionsUseCase(sl()));

  sl.registerFactory(() => TransactionCubit(sl()));
}