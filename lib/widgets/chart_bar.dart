import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctgOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctgOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 12,
          width: 35,
          child: FittedBox(
            child: Text(
              '\$${spendingAmount.toStringAsFixed(2)}',
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 80,
          width: 18,
          // color: Colors.green,
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 2.0,
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctgOfTotal,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}
