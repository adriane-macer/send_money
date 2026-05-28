import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/send_money_usecase.dart';

part 'send_money_state.dart';

class SendMoneyCubit
    extends Cubit<SendMoneyState> {
  final SendMoneyUseCase?
  sendMoneyUseCase;

  SendMoneyCubit({
    this.sendMoneyUseCase,
  }) : super(SendMoneyInitial());

  static const double walletBalance =
  500;

  void validateAmount(String value) {
    if (value.trim().isEmpty) {
      emit(
        const SendMoneyValidationError(
          'Amount is required',
        ),
      );

      return;
    }

    final amount = double.tryParse(value);

    if (amount == null) {
      emit(
        const SendMoneyValidationError(
          'Invalid amount',
        ),
      );

      return;
    }

    if (amount <= 0) {
      emit(
        const SendMoneyValidationError(
          'Amount must be greater than zero',
        ),
      );

      return;
    }

    if (amount > walletBalance) {
      emit(
        const SendMoneyValidationError(
          'Insufficient balance',
        ),
      );

      return;
    }

    emit(const SendMoneyValid());
  }

  Future<void> submitMoney(
      double amount,
      ) async {
    try {
      emit(SendMoneyLoading());

      await sendMoneyUseCase!(
        amount: amount,
      );

      emit(SendMoneySuccess());
    } catch (_) {
      emit(
        const SendMoneyFailure(
          'Failed to send money',
        ),
      );
    }
  }
}