import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Widgets */
import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';

/* Models */
import 'models/transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    print("balagaboom");
    print(txTitle);
    print(txAmount);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense'),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                children: [
                  Container(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Text('Widget 1'),
                      elevation: 10,
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    width: 165,
                    height: 165,
                    margin: EdgeInsets.only(top: 5),
                  ),
                  Container(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Text('Widget 2'),
                      elevation: 10,
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    width: 165,
                    height: 165,
                    margin: EdgeInsets.only(top: 5),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              TransactionList(_userTransactions)
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 40,
            ),
            onPressed: () => _showTransactionForm(context),
            backgroundColor: Colors.amber,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.commentDollar),
              title: Text('Budget'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidChartBar),
              title: Text('Statistics'),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
