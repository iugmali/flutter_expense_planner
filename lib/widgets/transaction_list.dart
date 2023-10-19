import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: _transactions.map((tx) {
    //     String formattedDate = "${(tx.date.day < 10) ? '0${tx.date.day}' : tx.date.day}/${tx.date.month}/${tx.date.year}";
    //     return Card(
    //       child: ListTile(
    //         leading: Container(
    //             decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    //             padding: const EdgeInsets.all(10),
    //             child: Text(
    //               "\$${tx.amount.toStringAsFixed(2)}",
    //               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //             )
    //         ),
    //         title: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(tx.title, style: const TextStyle(fontWeight: FontWeight.bold),),
    //             Text(formattedDate, style: const TextStyle(color: Colors.grey),)
    //           ],
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // );
    return _transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20,),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
            ],
          )
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, i) {
              Transaction tx = _transactions[i];
              String formattedDate =
                  "${(tx.date.day < 10) ? '0${tx.date.day}' : tx.date.day}/${tx.date.month}/${tx.date.year}";
              return Card(
                child: ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "\$${tx.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary),
                      )),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              );
            });
  }
}
