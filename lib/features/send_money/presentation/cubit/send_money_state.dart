part of 'send_money_cubit.dart';

sealed class SendMoneyState extends Equatable {
  const SendMoneyState();

  @override
  List<Object?> get props => [];
}

final class SendMoneyInitial extends SendMoneyState {}

final class SendMoneyValid extends SendMoneyState {
  const SendMoneyValid();
}

final class SendMoneyValidationError extends SendMoneyState {
  final String message;

  const SendMoneyValidationError(this.message);

  @override
  List<Object?> get props => [message];
}
