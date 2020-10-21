import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Widgets */
import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';
import './widgets/middle_ring.dart';
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
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        accentColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
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
                headline6: TextStyle(
                    fontSize:
                        24), // 'title' property is replaced by 'headline6'
              ),
        ),
        cardTheme: ThemeData.dark().cardTheme.copyWith(
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
      backgroundColor: Colors.transparent,
    );
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
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Row(
            //   children: [
            //     Flexible(
            //       child: Container(
            //         child: Card(
            //           clipBehavior: Clip.antiAlias,
            //           child: Center(
            //             child: Icon(
            //               Icons.add,
            //               size: 100,
            //               color: Colors.white,
            //             ),
            //           ),
            //           elevation: Theme.of(context).cardTheme.elevation,
            //           // color: Colors.redAccent,
            //           shape: Theme.of(context).cardTheme.shape,
            //         ),
            //         height: 165,
            //         margin: EdgeInsets.only(top: 5, left: 10),
            //       ),
            //     ),
            //     Flexible(
            //       // flex: 1,
            //       child: Container(
            //         child: Card(
            //           clipBehavior: Clip.antiAlias,
            //           child: Center(
            //             child: Container(
            //               //outer ring
            //               height: 140,
            //               width: 140,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 color: Colors.white70,
            //               ),
            //               child: MiddleRing(),
            //             ),
            //           ),
            //           elevation: Theme.of(context).cardTheme.elevation,
            //           shape: Theme.of(context).cardTheme.shape,
            //         ),
            //         // width: 165,
            //         height: 165,
            //         margin: EdgeInsets.only(top: 5, right: 10),
            //       ),
            //     ),
            //   ],
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ),
            MyChart(_thisWeekTransactions),
            TransactionList(_userTransactions),
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
