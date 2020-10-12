import 'package:flutter/material.dart';

class CreateTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  CreateTransaction(this.addNewTransaction);

  void submitData() {
    if (amountController.text.isNotEmpty || titleController.text.isNotEmpty) {
      if (double.parse(amountController.text) > 0) {

        final enteredTitle = titleController.text,
            enteredAmount = double  .parse(amountController.text);

        addNewTransaction(enteredTitle, enteredAmount);

      } else {
        return;
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onSubmitted: (_) => submitData(),
              ),
              Container(
                child: FlatButton(
                  child: Text(
                    'Create',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 1),
                  ),
                  onPressed: submitData,
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
              )
            ],
          ),
          padding: EdgeInsets.all(12),
        ),
        color: Colors.amber,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      width: 350,
      margin: EdgeInsets.only(top: 5),
    );
  }
}
