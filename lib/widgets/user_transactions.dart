import 'package:flutter/material.dart';

/* Widgets */
import './transaction_list.dart';
import './create_transaction_form.dart';

/* Models */
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Groceries',
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Hygiene',
      amount: 1500,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: '3',
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
