import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transactionslist.dart';
import './widgets/charts.dart';
import './models/transaction.dart';

void main() => runApp(MyBudgetApp());

class MyBudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Budget Planner',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.purple,
        cardColor: Colors.deepPurple,
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 25,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 25,
              ),
              bodyText1: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //String amountInput;
  //String itemInput;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [];
  bool showChart = false;

  List<Transaction> get recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime txselectedDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: txAmount,
        date: txselectedDate,
        title: txTitle);

    setState(() {
      transactions.add(newTx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context);
    final landscapeMode = mQ.orientation == Orientation.landscape;
    
    final appBar = AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        'Budget Planner',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );

    final txList = Container(
                      height: (mQ.size.height -
                              appBar.preferredSize.height -
                              mQ.padding.top) *
                          0.6,
                      child: TransactionsList(transactions, deleteTransaction));

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Item 1',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (landscapeMode) Row(     //shortened IF conditional for lists to show only one outcome or not
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart'),
                  Switch(
                    value: showChart,
                    onChanged: (val) {
                      setState(() {
                        showChart = val;
                      });
                    },
                  )
                ],
              ),
              if (!landscapeMode) Container(
                      height: (mQ.size.height -
                              appBar.preferredSize.height -
                              mQ.padding.top) *
                          0.3,
                      child: Chart(recentTransactions)),

              if (!landscapeMode) txList,

              if (landscapeMode) showChart
                  ? Container(
                      height: (mQ.size.height -
                              appBar.preferredSize.height -
                              mQ.padding.top) *
                          0.7,
                      child: Chart(recentTransactions))
                  : txList 
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
