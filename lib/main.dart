import 'package:flutter/material.dart';

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
                    ),
                    width: 165,
                    height: 165,
                  ),
                  Container(
                    child: Card(
                      child: Text('Widget 2'),
                      elevation: 10,
                      color: Colors.redAccent,
                    ),
                    width: 165,
                    height: 165,
                  ),                                    
                ],
              ),
              Column(
                children: [
                  Card(
                    child: Text('Transactions'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
