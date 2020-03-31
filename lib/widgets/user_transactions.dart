import 'package:flutter/material.dart';

import './transactionslist.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

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
 

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), amount: txAmount, date: DateTime.now(), title: txTitle);
  
    setState(() {
      transactions.add(newTx);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionsList(transactions),
      ],
    );
  }
}
