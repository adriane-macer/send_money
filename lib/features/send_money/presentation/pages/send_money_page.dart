import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money/core/di/injection.dart';

import '../cubit/send_money_cubit.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() =>
      _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final amountController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => sl<SendMoneyCubit>(),
          child: BlocConsumer<
              SendMoneyCubit,
              SendMoneyState>(
            listener: (context, state) {
              if (state is SendMoneySuccess) {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          'Money Sent Successfully',
                        ),
                      ),
                    );
                  },
                );
              }

              if (state is SendMoneyFailure) {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          state.message,
                        ),
                      ),
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              String? errorText;

              if (state
              is SendMoneyValidationError) {
                errorText = state.message;
              }

              return Column(
                children: [
                  TextField(
                    controller:
                    amountController,
                    keyboardType:
                    TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .allow(
                        RegExp(
                          r'^\d*\.?\d*$',
                        ),
                      ),
                    ],
                    decoration:
                    InputDecoration(
                      labelText: 'Amount',
                      errorText: errorText,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final amount = double.tryParse(
                        amountController.text,
                      );

                      context
                          .read<SendMoneyCubit>()
                          .validateAmount(
                        amountController.text,
                      );

                      final currentState =
                          context
                              .read<SendMoneyCubit>()
                              .state;

                      if (currentState
                      is SendMoneyValid) {
                        context
                            .read<SendMoneyCubit>()
                            .submitMoney(
                          amount!,
                        );
                      }
                    },
                    child: state is SendMoneyLoading
                        ? const CircularProgressIndicator()
                        : const Text('Submit'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}