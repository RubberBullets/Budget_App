import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() => runApp(MyBudgetApp());

class MyBudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Budget Planner',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
 
  //String amountInput;
  //String itemInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Budget Planner',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Budget Planner'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: double.infinity,
                child: Card(
                  child: Text('hey hey'),
                ),
              ),
              UserTransactions(),
            ]),
      ),
    );
  }
}
