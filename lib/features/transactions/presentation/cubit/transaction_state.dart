part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionLoading extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionSuccess extends TransactionState {
  final List<TransactionEntity> data;

  const TransactionSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class TransactionFailure extends TransactionState {
  final String message;

  const TransactionFailure(this.message);

  @override
  List<Object?> get props => [message];
}
