import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/send_money_cubit.dart';

class SendMoneyPage
    extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() =>
      _SendMoneyPageState();
}

class _SendMoneyPageState
    extends State<SendMoneyPage> {
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
        child: BlocConsumer<
            SendMoneyCubit,
            SendMoneyState>(
          listener: (context, state) {},
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
                    context
                        .read<
                        SendMoneyCubit>()
                        .validateAmount(
                      amountController
                          .text,
                    );
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}