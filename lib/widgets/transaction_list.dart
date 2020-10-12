import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/* Models */
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.format_list_bulleted,
                size: 35,
              ),
              title: Text(
                'Transactions',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            Column(
              children: transactions.map((tx) {
                return ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text(
                    tx.title,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: Text(
                    '₱ ${tx.amount}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      width: 350,
      height: 450,
      margin: EdgeInsets.only(top: 5, bottom: 20),
    );
  }
}
