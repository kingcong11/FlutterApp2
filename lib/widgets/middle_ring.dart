import 'package:flutter/material.dart';

class MiddleRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  //  edge shadow
                  BoxShadow(
                      offset: Offset(-1.5, -1.5),
                      color: Colors.grey[350],
                      spreadRadius: 2.0),
                  // circular shadow
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.white,
                      spreadRadius: 2.0)
                ]),
          ),
        ),
      ),
    );
  }
}
