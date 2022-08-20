import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionCard extends StatelessWidget {
  Transaction transaction;
  final Function deleteTransaction;
  TransactionCard(
      {Key? key, required this.transaction, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        //onTap: () => print(MediaQuery.of(context).size.width),
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${transaction.amount.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 412
            ? TextButton.icon(
                onPressed: () => deleteTransaction(transaction.id),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor,
                ),
                icon: Icon(
                  Icons.delete_outlined,
                  color: Theme.of(context).errorColor,
                ),
                label: Text("Delete"),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete_outlined,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => deleteTransaction(transaction.id),
              ),
      ),
    );
  }
}

/* Card(
        //color: Color.fromARGB(255, 151, 207, 235),
        elevation: 5,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  DateFormat.yMMMd().format(transaction.date),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ), */