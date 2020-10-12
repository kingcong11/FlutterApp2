import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/* Models */
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

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
            Container(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    trailing: Text(
                      '₱ ${transactions[index].amount.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              width: double.infinity,
              height: 370,
            )
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
