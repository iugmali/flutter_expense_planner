import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_form.dart';
import 'package:flutter_expense_planner/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction('t1', 'Clothes', 159.99, DateTime.now()),
    Transaction('t2', 'Food', 45, DateTime.now()),
    Transaction('t3', 'Hotel', 500.00, DateTime.now()),
  ];

  void _addTransaction (String title, double amount) {
    final newTx = Transaction(UniqueKey().toString(), title, amount, DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        Expanded(child: TransactionList(_transactions))
      ],
    );
  }
}
