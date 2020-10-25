import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class MyChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  MyChart(this.recentTransactions);

  List get groupedTransactionValues {
    var currentDay = DateTime.now();
    var mondayOfTheWeek;

    switch (DateFormat.E().format(currentDay)) {
      case 'Mon':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 0));
        break;
      case 'Tue':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 1));
        break;
      case 'Wed':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 2));
        break;
      case 'Thu':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 3));
        break;
      case 'Fri':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 4));
        break;
      case 'Sat':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 5));
        break;
      case 'Sun':
        mondayOfTheWeek = currentDay.subtract(Duration(days: 6));
        break;
    }

    return List.generate(7, (index) {
      final dateIteration = mondayOfTheWeek.add(Duration(days: index));
      var totalAmount = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == dateIteration.day &&
            recentTransactions[i].date.month == dateIteration.month &&
            recentTransactions[i].date.year == dateIteration.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(dateIteration),
        'amount': totalAmount,
        'date': dateIteration.day
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, element) {
      return sum += element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: Theme.of(context).cardTheme.elevation,
      shape: Theme.of(context).cardTheme.shape,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'This Week',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Expenses',
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: groupedTransactionValues.map((data) {
                      return Flexible(
                        fit: FlexFit.tight,
                        child: ChartBar(
                          data['day'],
                          data['amount'],
                          (totalSpending == 0)
                              ? 0.0
                              : ((data['amount'] as double) / totalSpending),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
        overflow: Overflow.clip,
      ),
    );
  }
}
