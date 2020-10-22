import 'package:flutter/material.dart';

/* Widgets */
import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';
import './widgets/chart.dart';

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
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        accentColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        fontFamily: 'Product',
        
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(fontFamily: 'Quicksand', fontSize: 32),
          headline2: TextStyle(fontFamily: 'Quicksand', fontSize: 24),
          headline3: TextStyle(fontFamily: 'Quicksand', fontSize: 18.72),
          headline4: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
          headline5: TextStyle(fontFamily: 'Quicksand', fontSize: 13.28),
          headline6: TextStyle(fontFamily: 'Quicksand', fontSize: 10.72),
          subtitle1: TextStyle(fontFamily: 'Product'),
          button: TextStyle(
            color: Colors.white,
            fontFamily: 'Product',
          ),

        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontSize:
                        24), // 'title' property is replaced by 'headline6'
              ),
        ),
        cardTheme: ThemeData.light().cardTheme.copyWith(
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)),
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
    // Transaction(
    //   id: '1',
    //   title: 'Groceries',
    //   amount: 3000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: 'Hygiene',
    //   amount: 1500,
    //   date: DateTime.now(),
    // )
  ];

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate, Key key) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: txDate,
      id: key.toString(),
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
      backgroundColor: Colors.transparent,
    );
  }

  void _deleteTransaction(String txID) {
    // print('I am triggered');
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == txID);
    });
  }
  /* Getters */

  List<Transaction> get _thisWeekTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
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
        actions: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: (){
              _userTransactions.forEach((element) => print(element.title));
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            MyChart(_thisWeekTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(FontAwesomeIcons.commentDollar),
      //       title: Text('Budget'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(FontAwesomeIcons.solidChartBar),
      //       title: Text('Statistics'),
      //     ),
      //   ],
      // ),
    );
  }
}
