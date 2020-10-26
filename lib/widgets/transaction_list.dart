import 'package:flutter/material.dart';
import 'transaction_item.dart';

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
          const ListTile(
            leading: Icon(
              Icons.format_list_bulleted,
              size: 35,
            ),
            title: Text(
              'Transactions',
              style: TextStyle(fontSize: 22),
            ),
          ),
          const Divider(),
          Expanded(
            child: Container(
              child: (transactions.isNotEmpty)
                  ? 
                    /* flutter still doesn't resolve the bug where even you already provide a key,
                     strange behavior still exists so I need to use listview instead of a listview buildr */

                    // ListView.builder( 
                    //   itemCount: transactions.length,
                    //   itemBuilder: (ctx, index) {
                    //     return TransactionItem(
                    //       key: ValueKey(transactions[index].id), 
                    //       transaction: transactions[index], 
                    //       deleteTransaction: deleteTransaction,
                    //     );
                    //   },
                    // )
                    ListView(
                      children: transactions.map((tx){
                        return TransactionItem(
                          key: ValueKey(tx.id),
                          transaction: tx,
                          deleteTransaction: deleteTransaction
                        );
                      }).toList(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'It feels empty here, let\'s create your first transaction.',
                            style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w500),
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
