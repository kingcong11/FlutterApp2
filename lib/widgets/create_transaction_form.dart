import 'package:flutter/material.dart';

class CreateTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  CreateTransaction(this.addNewTransaction);

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
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                child: FlatButton(
                  child: Text(
                    'Create',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 1),
                  ),
                  onPressed: () {
                    addNewTransaction(titleController.text, double.parse(amountController.text));
                  },
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
        color: Colors.orangeAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      width: 350,
      margin: EdgeInsets.only(top: 5),
    );
  }
}
