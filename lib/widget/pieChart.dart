import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neoapp/data.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            boxShadow: customShadow,
            shape: BoxShape.circle,
            color: primaryColor),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomPaint(
                child: Container(),
                foregroundPainter: PieChartPainter(),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                    child: Text(
                  "\$1234",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    boxShadow: customShadow,
                    shape: BoxShape.circle,
                    color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    double total = 0;
    expenses.forEach((element) {
      total += element["amount"];
    });

    var startRadian = -pi / 2;
    for (int i = 0; i < expenses.length; i++) {
      var currentExpenses = expenses[i];
      var sweepRadian = (currentExpenses["amount"] / total) * 2 * pi;
      paint.color = pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
