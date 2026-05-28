import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';

void main() {
  late WalletCubit cubit;

  setUp(() {
    cubit = WalletCubit();
  });

  tearDown(() {
    cubit.close();
  });

  test(
    'initial state should show balance',
        () {
      expect(
        cubit.state,
        const WalletState(
          balance: 500,
          isBalanceVisible: true,
        ),
      );
    },
  );

  blocTest<WalletCubit, WalletState>(
    'should hide balance when toggled once',
    build: () => cubit,
    act: (cubit) => cubit.toggleBalanceVisibility(),
    expect: () => [
      const WalletState(
        balance: 500,
        isBalanceVisible: false,
      ),
    ],
  );

  blocTest<WalletCubit, WalletState>(
    'should show balance when toggled twice',
    build: () => cubit,
    act: (cubit) {
      cubit.toggleBalanceVisibility();
      cubit.toggleBalanceVisibility();
    },
    expect: () => [
      const WalletState(
        balance: 500,
        isBalanceVisible: false,
      ),
      const WalletState(
        balance: 500,
        isBalanceVisible: true,
      ),
    ],
  );
}