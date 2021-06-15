import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX) {
    print('Constructor NewTransction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
    } 
}

class _NewTransactionState extends State<NewTransaction> {
  final itemController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

  _NewTransactionState() {
    print('constructor NewTransaction State');
  }

  @override
  void initState() {
    print('initstate()');
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

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
    print('new transaction state builded');
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, MediaQuery.of(context).viewInsets.bottom+5),
        child: Card(
          elevation: 5,
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                 TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Transaction Item:',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  onSubmitted: (_) => submitData(),
                  //onChanged: (val) {
                  // itemInput=val;
                  //
                  //},
                  controller: itemController,
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  onSubmitted: (_) => submitData(),
                  decoration: const InputDecoration(
                    labelText: 'Transaction Amount:',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      
                      FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: _presentDatePicker,
                          child: const Text(
                            'Choose Date',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'Add Transaction',
                    style: const TextStyle(
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
