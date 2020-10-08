import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Widgets */

/* Classes */
import './transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Groceries',
      amount: 3000,
      date: DateTime.now()
    ),
    Transaction(
      id: '2',
      title: 'Hygiene',
      amount: 1500,
      date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense'),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Card(
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
              Column(
                children: [
                  Container(
                    child: Card(
                      child: Text('Transactions'),
                      elevation: 10,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    width: 350,
                    height: 440,
                    margin: EdgeInsets.only(top: 5),
                  ),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: Stack(
          overflow: Overflow.visible,
          alignment: FractionalOffset(.5, 1),
          children: [
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.commentDollar),
                  title: Text('Budget'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                  title: Text('Statisctics'),
                ),
              ], 
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 40,
                 ),
                onPressed: () => print('I am clicked'),
                backgroundColor: Colors.amber,
              ),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
