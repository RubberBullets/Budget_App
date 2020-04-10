import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Container(
          color: Colors.greenAccent,
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          //margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(
            '\$${transaction.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              shadows: <Shadow>[
                const Shadow(
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 2.0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          //tx.date.toString(),
          //'DATE ${tx.date.month}/${tx.date.day}/${tx.date.year} TIME ${tx.date.hour}:${tx.date.minute}:${tx.date.second}',
          DateFormat.yMMMd().format(transaction.date),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 360 
        ? FlatButton.icon(onPressed: () => deleteTx(transaction.id),
         color: Theme.of(context).primaryColor,
         icon: const Icon(Icons.delete,
         color: Colors.white,
         ),
        label: const Text('DELETE',
          style: const TextStyle(
            color: Colors.white,
          ),
        ))
        
        : IconButton(icon: const Icon(Icons.delete), 
        onPressed: () => deleteTx(transaction.id),
        color: Colors.white,),
      ),
    );
  }
}
