import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double amount, DateTime date) _save;
  TransactionForm(this._save, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submit() {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount <= 0 || _titleController.text.isEmpty || _selectedDate == null) {
      return;
    }
    widget._save(_titleController.text, amount, _selectedDate!);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(context: context, initialDate: (_selectedDate == null) ? DateTime.now() : _selectedDate!, firstDate: DateTime(2023), lastDate: DateTime.now());
    if (pickedDate == null) {
      return;
    }
    setState(() {
      _selectedDate = pickedDate;
    });

  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = "No date chosen!";
    if (_selectedDate != null) {
      formattedDate =
          "${(_selectedDate!.day < 10) ? '0${_selectedDate!.day}' : _selectedDate!.day}/${(_selectedDate!.month < 10) ? '0${_selectedDate!.month}' : _selectedDate!.month}/${_selectedDate!.year}";
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: 'Title'
            ),
            controller: _titleController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Amount'
            ),
            keyboardType: TextInputType.number,
            controller: _amountController,
            onSubmitted: (_) => _submit(),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Text(formattedDate),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text('Choose date', style: TextStyle(fontWeight: FontWeight.bold),)
                )
              ],
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary)),
              onPressed: _submit,
              child: const Text("Add Transaction")
          )
        ],
      ),
    );
  }
}
