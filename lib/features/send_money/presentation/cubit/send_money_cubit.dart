

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_money_state.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit() : super(SendMoneyInitial());

  static const double walletBalance = 500;

  void validateAmount(String value) {
    if (value.trim().isEmpty) {
      emit(const SendMoneyValidationError('Amount is required'));

      return;
    }

    final amount = double.tryParse(value);

    if (amount == null) {
      emit(const SendMoneyValidationError('Invalid amount'));

      return;
    }

    if (amount <= 0) {
      emit(const SendMoneyValidationError('Amount must be greater than zero'));

      return;
    }

    if (amount > walletBalance) {
      emit(const SendMoneyValidationError('Insufficient balance'));

      return;
    }

    emit(const SendMoneyValid());
  }
}
