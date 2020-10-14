import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Widgets */
import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';

/* Models */
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      home: MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        accentColor: Color(0xFFb64fc8),
        iconTheme: IconThemeData(color: Color(0xFFea80fc)),
        fontFamily: 'Product',
        textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: TextStyle(fontFamily: 'Quicksand', fontSize: 32),
          headline2: TextStyle(fontFamily: 'Quicksand', fontSize: 24),
          headline3: TextStyle(fontFamily: 'Quicksand', fontSize: 18.72),
          headline4: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
          headline5: TextStyle(fontFamily: 'Quicksand', fontSize: 13.28),
          headline6: TextStyle(fontFamily: 'Quicksand', fontSize: 10.72),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme.copyWith(
            headline6: TextStyle(fontSize: 24), // 'title' property is replaced by 'headline6'
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
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

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        },
        backgroundColor: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.strikethrough_s,
          size: 35,
        ),
        title: Text('ExpenSave'),
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
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                    elevation: 10,
                    // color: Colors.redAccent,
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
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                    elevation: 10,
                    // color: Colors.redAccent,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () => _showTransactionForm(context),
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
    );
  }
}
