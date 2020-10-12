import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Widgets */
import './widgets/user_transactions.dart';

/* Models */

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
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
              UserTransactions()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () => print('action button clicked'),
          backgroundColor: Colors.amber,
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
