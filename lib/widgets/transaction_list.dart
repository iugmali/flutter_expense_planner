import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function(String id) _deleteTransaction;
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, this._deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
            ],
          )
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, i) {
              Transaction tx = _transactions[i];
              String formattedDate =
                  "${(tx.date.day < 10) ? '0${tx.date.day}' : tx.date.day}/${(tx.date.month < 10) ? '0${tx.date.month}' : tx.date.month}/${tx.date.year}";
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${tx.amount.toStringAsFixed(2)}'),
                        ),
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(formattedDate, style: const TextStyle(color: Colors.grey),),
                  trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).colorScheme.error, onPressed: () => _deleteTransaction(tx.id),),
                ),
              );
            });
  }
}
