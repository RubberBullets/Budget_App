import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addTX;
  final itemController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTX);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            addTX(itemController.text,double.parse(amountController.text));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}