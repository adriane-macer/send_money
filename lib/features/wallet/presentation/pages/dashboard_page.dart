import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/wallet_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocBuilder<
          WalletCubit,
          WalletState>(
        builder: (context, state) {
          final balanceText =
          state.isBalanceVisible
              ? '₱${state.balance.toStringAsFixed(2)}'
              : '******';

          return Padding(
            padding:
            const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wallet Balance',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      balanceText,
                      style:
                      const TextStyle(
                        fontSize: 32,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        state
                            .isBalanceVisible
                            ? Icons.visibility
                            : Icons
                            .visibility_off,
                      ),
                      onPressed: () {
                        context
                            .read<
                            WalletCubit>()
                            .toggleBalanceVisibility();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}