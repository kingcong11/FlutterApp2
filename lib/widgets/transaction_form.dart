import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  TransactionForm(this.addNewTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isNotEmpty &&
        _titleController.text.isNotEmpty &&
        _selectedDate != null) {
      if (double.parse(_amountController.text) > 0) {
        final enteredTitle = _titleController.text;
        final enteredAmount = double.parse(_amountController.text);

        widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate, UniqueKey());

        // this pops the top most active screen
        Navigator.of(context).pop();
      } else {
        return;
      }
    } else {
      return;
    }
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(int.parse(DateTime.now().year.toString())),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = selectedDate;
        });
      }
    });
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
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                ),
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                ),
                onSubmitted: (_) => _submitData(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        (_selectedDate == null)
                            ? 'No Chosen Date'
                            : DateFormat.yMMMMd().format(_selectedDate),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).accentColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: .3,
                            fontSize: 16),
                      ),
                      onPressed: _showDatePicker,
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          'Create',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _submitData,
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        margin: EdgeInsets.all(0),
      ),
    );
  }
}
