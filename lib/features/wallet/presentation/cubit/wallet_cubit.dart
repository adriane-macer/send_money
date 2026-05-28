import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit()
      : super(
    const WalletState(
      balance: 500,
      isBalanceVisible: true,
    ),
  );

  void toggleBalanceVisibility() {
    emit(
      state.copyWith(
        isBalanceVisible:
        !state.isBalanceVisible,
      ),
    );
  }
}