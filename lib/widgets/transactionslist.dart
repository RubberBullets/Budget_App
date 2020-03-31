import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final List<Transaction> transactions = [
    Transaction(
      amount: 54.95,
      date: DateTime.now(),
      id: "0001",
      title: 'Batteries',
    ),
    Transaction(
      amount: 94.95,
      date: DateTime.now(),
      id: "0002",
      title: 'Charger',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.greenAccent,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    '\$${tx.amount}',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      //tx.date.toString(),
                      //'DATE ${tx.date.month}/${tx.date.day}/${tx.date.year} TIME ${tx.date.hour}:${tx.date.minute}:${tx.date.second}',
                      DateFormat().format(tx.date),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
