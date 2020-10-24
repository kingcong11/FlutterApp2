import 'package:flutter/material.dart';

/* Widgets */
import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';
import './widgets/chart.dart';

/* Models */
import 'models/transaction.dart';

void main() {
  /* locking the app to only available in portrait mode; import serices package if you want to apply this setting */
  // WidgetsFlutterBinding();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
                  fontSize: 24,
                ), // 'title' property is replaced by 'headline6'
              ),
        ),
        cardTheme: ThemeData.light().cardTheme.copyWith(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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

  final List<Transaction> _userTransactions = [];

  /* Methods */
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
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: (MediaQuery.of(context).size.height * .5) + MediaQuery.of(context).viewInsets.bottom,
          child: TransactionForm(_addNewTransaction, MediaQuery.of(context).viewInsets.bottom),
        );
      },   
    );
  }

  void _deleteTransaction(String txID) {
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

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      leading: Icon(
        Icons.strikethrough_s,
        size: 35,
      ),
      title: Text('ExpenSave'),
    );

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* landscape Mode View */
            if(isLandscape)
              Container(
                height: ((MediaQuery.of(context).size.height - (appbar.preferredSize.height + MediaQuery.of(context).padding.top)) * .7),
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                child: MyChart(_thisWeekTransactions),
              ),
            if(isLandscape)
              Container(
                height: ((MediaQuery.of(context).size.height - (appbar.preferredSize.height + MediaQuery.of(context).padding.top)) * 1.1),
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                child: TransactionList(_userTransactions, _deleteTransaction),
              ),


            /* Portrait Mode View */
            if(!isLandscape)
              Container(
                height: ((MediaQuery.of(context).size.height - (appbar.preferredSize.height + MediaQuery.of(context).padding.top)) * .3),
                margin: Theme.of(context).cardTheme.margin,
                child: MyChart(_thisWeekTransactions),
              ),
            if(!isLandscape)
              Container(
                height: ((MediaQuery.of(context).size.height - (appbar.preferredSize.height + MediaQuery.of(context).padding.top)) * .67),
                margin: Theme.of(context).cardTheme.margin,
                child: TransactionList(_userTransactions, _deleteTransaction),
              ),
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
    );
  }
}
