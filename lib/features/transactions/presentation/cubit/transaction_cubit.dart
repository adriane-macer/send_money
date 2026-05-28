import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money/features/transactions/domain/entities/transaction_entity.dart';
import 'package:send_money/features/transactions/domain/usecases/get_transactions_usecase.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final GetTransactionsUseCase useCase;

  TransactionCubit(this.useCase)
      : super(TransactionInitial());

  Future<void> fetch() async {
    try {
      emit(TransactionLoading());

      final data = await useCase();

      emit(TransactionSuccess(data));
    } catch (_) {
      emit(TransactionFailure('Failed to load transactions'));
    }
  }
}