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
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.format_list_bulleted,
                              size: 35,
                            ),
                            title: Text('Transactions', style: TextStyle(fontSize: 20),),
                          ),
                          Divider(),
                          Column(
                            // direction: Axis.vertical,
                            children: transactions.map((tx){
                              return ListTile(
                                leading: Icon(Icons.attach_money), 
                                title: Text(
                                  tx.title,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                subtitle: Text(
                                  tx.date.toString(),
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                trailing: Text(
                                  tx.amount.toString(),
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                );
                            }).toList()
                          ),
                        ],
                      ),
                      // color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.grey[600],
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

        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () => print('action button clicked'),
          backgroundColor: Colors.amber,
        ),

        floatingActionButtonLocation: (FloatingActionButtonLocation.centerDocked),
        
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
