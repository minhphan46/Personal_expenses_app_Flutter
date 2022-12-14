import 'package:flutter/material.dart';
import 'transaction_card.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(
      {required this.transactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Text(
                  "No transaction added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/gai_xinh.jpg',
                    fit: BoxFit.cover, // chinh anh vua voi khung hinh
                  ),
                ),
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionCard(
                transaction: transactions[index],
                deleteTransaction: deleteTransaction,
              );
            },
            itemCount: transactions.length,
          );
  }
}
