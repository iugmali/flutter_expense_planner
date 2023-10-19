import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double amount) _save;
  TransactionForm(this._save, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submit() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount <= 0 || titleController.text.isEmpty) {
      return;
    }
    widget._save(titleController.text, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Title'
            ),
            controller: titleController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount'
            ),
            keyboardType: TextInputType.number,
            controller: amountController,
            onSubmitted: (_) => _submit(),
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
