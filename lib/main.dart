import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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

  final titleController =  TextEditingController();
  final amountController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense'),
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
              Column(
                children: [
                  Container(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        child: Column(
                          children: [
                            TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                            TextField(
                              controller: amountController,
                              decoration: InputDecoration(
                                labelText: 'Amount',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Container(
                              child: FlatButton(
                                child: Text(
                                  'Create',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 1
                                  ),
                                ),
                                onPressed: () {
                                  print(titleController.text);
                                  print(amountController.text);
                                },
                                color: Colors.black87,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10),
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(12),
                      ),
                      color: Colors.orangeAccent,
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    width: 350,
                    margin: EdgeInsets.only(top: 5),
                  ),
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
                                  // DateFormat.yMMMd().add_jm().format(tx.date),
                                  DateFormat.yMMMd().format(tx.date),
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                trailing: Text(
                                  '₱ ${tx.amount}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                );
                            }).toList()
                          ),
                        ],
                      ),
                      // color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 3,
                    ),
                    width: 350,
                    height: 440,
                    margin: EdgeInsets.only(top: 5, bottom: 20),
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
