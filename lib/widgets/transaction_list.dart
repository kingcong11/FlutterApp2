import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/* Models */
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.format_list_bulleted,
              size: 35,
            ),
            title: Text(
              'Transactions',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              child: (transactions.isNotEmpty)
                  ? ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (ctx, index) {
                        return Dismissible(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline3.copyWith(
                                  // copyWith() overrides the existing themeData of BuildContext
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(color: Color(0xFF9a9a9a)),
                            ),
                            trailing: Container(
                              width: 120,
                              child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          background: Container(
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          key: ValueKey(transactions[index].id),
                          onDismissed: (direction) {
                            deleteTransaction(transactions[index].id);

                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Transaction Deleted.',
                                style: TextStyle(fontSize: 19),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(milliseconds: 2300),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                            ));
                          },
                        );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'It feels empty here, let\'s create your first transaction.',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/illustrations/404/Png/spaceman.png',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      elevation: Theme.of(context).cardTheme.elevation,
      shape: Theme.of(context).cardTheme.shape,
    );
  }
}
