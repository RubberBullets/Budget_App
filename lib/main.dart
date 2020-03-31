import 'package:flutter/material.dart';

import './widgets/transactionslist.dart';



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
  final itemController = TextEditingController();
  final amountController = TextEditingController();

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
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Card(
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Transaction Item:',
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          //onChanged: (val) {
                          // itemInput=val;
                          //
                          //},
                          controller: itemController,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Transaction Amount:',
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          //onChanged: (val){
                          // amountInput=val;
                          //},
                          controller: amountController,
                        ),
                        FlatButton(
                          color: Colors.blueAccent,
                          child: Text(
                            'Add Transaction',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            //print(itemInput);
                            //print(amountInput);
                            print(itemController.text);
                            print(amountController.text);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TransactionsList(),
            ]),
      ),
    );
  }
}
