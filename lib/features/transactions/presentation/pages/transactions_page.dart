import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money/core/di/injection.dart';

import '../cubit/transaction_cubit.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: BlocProvider(
        create: (context) => sl<TransactionCubit>()..fetch(),
        child: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TransactionFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TransactionCubit>().fetch();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is TransactionSuccess) {
              if (state.data.isEmpty) {
                return const Center(
                  child: Text('No transactions found'),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<TransactionCubit>().fetch();
                },
                child: ListView.separated(
                  itemCount: state.data.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) {
                    final item = state.data[index];

                    return ListTile(
                      leading: const Icon(Icons.swap_horiz),
                      title: Text(item.title),
                      subtitle: Text('₱${item.amount.toStringAsFixed(2)}'),
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}