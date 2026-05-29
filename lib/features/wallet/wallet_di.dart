import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';

void setupWalletDI(){
  sl.registerFactory(() => WalletCubit());
}