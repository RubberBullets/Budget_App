import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

  void submitData() {
    if (amountController.text.isEmpty){
      return;
    }
    final enteredItem = itemController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredItem.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addTX(
      enteredItem,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
        ).then((pickedDate) {
          if(pickedDate==null){return;}
          setState(() {
            selectedDate=pickedDate;
          });
          
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, MediaQuery.of(context).viewInsets.bottom+5),
        child: Card(
          elevation: 5,
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Transaction Item:',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  onSubmitted: (_) => submitData(),
                  //onChanged: (val) {
                  // itemInput=val;
                  //
                  //},
                  controller: itemController,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  onSubmitted: (_) => submitData(),
                  decoration: InputDecoration(
                    labelText: 'Transaction Amount:',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  //onChanged: (val){
                  // amountInput=val;
                  //},
                  controller: amountController,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      
                        
                        Expanded(
                                                child: Text(
                            selectedDate==null?'No Date Chosen': DateFormat.yMd().format(selectedDate),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      
                      FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: _presentDatePicker,
                          child: Text(
                            'Choose Date',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: submitData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
