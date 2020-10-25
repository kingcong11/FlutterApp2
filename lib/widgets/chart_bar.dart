import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctgOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctgOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * .16,
            width: 35,
            child: FittedBox(
              child: Text(
                '\$${spendingAmount.toStringAsFixed(2)}',
              ),
            ),
          ),
          SizedBox(height: constraints.maxHeight * .03),
          Container(
            height: constraints.maxHeight * .65,
            width: 18,
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
                Container(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: spendingPctgOfTotal,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * .03),
          Container(
            child: FittedBox(
              child: Text(label),
            ),
            height: constraints.maxHeight * .13,
          )
        ],
      );
    });
  }
}
