import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _avatarColor;

  @override
  void initState() {

    super.initState();

    const availableColors = [
      Colors.orange,
      Colors.blue,
      Colors.cyan,
      Colors.redAccent
    ];

    _avatarColor = availableColors[Random().nextInt(availableColors.length)];

  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _avatarColor,
          child: const Icon(
            Icons.attach_money,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline3.copyWith(
              // copyWith() overrides the existing themeData of BuildContext
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: const TextStyle(color: Color(0xFF9a9a9a)),
        ),
        trailing: Container(
          width: 120,
          child: Text(
            '\$${widget.transaction.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      background: Container(
        color: Colors.redAccent,
        child: const Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.redAccent,
        child: const Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      // key: ValueKey(widget.transaction.id),
      key: widget.key,
      onDismissed: (direction) {
        widget.deleteTransaction(widget.transaction.id);

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            'Transaction Deleted.',
            style: TextStyle(fontSize: 19),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 2300),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ));
      },
    );
  }
}