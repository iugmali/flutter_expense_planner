import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String title, double amount) _save;
  TransactionForm(this._save, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submit() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount <= 0 || titleController.text.isEmpty) {
      return;
    }
    _save(titleController.text, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: amountController,
          ),
          TextButton(
              onPressed: _submit,
              child: const Text("Add transaction")
          )
        ],
      ),
    );
  }
}
