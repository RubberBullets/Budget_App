import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';


class TransactionsList extends StatelessWidget {
  
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionsList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('transaction list builded');
    return Container(
        
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (context,constraints){
              return Column(
                children: <Widget>[
                  const Text(
                    'No Transactions to show, Pease add some.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight*0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
           
            : ListView.builder(
                itemBuilder: (txlist, index) {
                  return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
                  //     return Card(
                  //       child: Container(
                  //         width: double.infinity,
                  //         padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //         child: Row(
                  //           children: <Widget>[
                  //             Container(
                  //               color: Colors.greenAccent,
                  //               padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //               margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //               child: Text(
                  //                 '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //                 style: TextStyle(
                  //                   fontSize: 25,
                  //                   color: Colors.white,
                  //                   shadows: <Shadow>[
                  //                         Shadow(
                  //                           offset: Offset(1.0, 1.0),
                  //                           blurRadius: 2.0,
                  //                           color: Color.fromARGB(255, 0, 0, 0),
                  //                         ),
                  //                       ],
                  //                 ),
                  //               ),
                  //             ),
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: <Widget>[
                  //                 Text(
                  //                   transactions[index].title,
                  //                   style: TextStyle(
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,

                  //                       ),
                  //                 ),
                  //                 Text(
                  //                   //tx.date.toString(),
                  //                   //'DATE ${tx.date.month}/${tx.date.day}/${tx.date.year} TIME ${tx.date.hour}:${tx.date.minute}:${tx.date.second}',
                  //                   DateFormat().format(transactions[index].date),
                  //                   style: TextStyle(
                  //                     fontSize: 12,
                  //                     color: Colors.grey,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                },
                itemCount: transactions.length,
              ));
  }
}

