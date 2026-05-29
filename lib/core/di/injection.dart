import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:send_money/features/auth/auth_di.dart';
import 'package:send_money/features/send_money/send_money_di.dart';
import 'package:send_money/features/transactions/transaction_di.dart';
import 'package:send_money/features/wallet/wallet_di.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  sl.registerLazySingleton(() => http.Client());

  setupAuthDI();

  setupWalletDI();

  setupTransactionDI();

  setupSendMoneyDI();
}
