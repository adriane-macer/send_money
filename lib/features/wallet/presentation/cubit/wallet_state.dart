part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  final double balance;
  final bool isBalanceVisible;

  const WalletState({
    required this.balance,
    required this.isBalanceVisible,
  });

  WalletState copyWith({
    double? balance,
    bool? isBalanceVisible,
  }) {
    return WalletState(
      balance: balance ?? this.balance,
      isBalanceVisible:
      isBalanceVisible ??
          this.isBalanceVisible,
    );
  }

  @override
  List<Object?> get props => [
    balance,
    isBalanceVisible,
  ];
}