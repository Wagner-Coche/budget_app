import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarChart extends StatelessWidget {
  const BarChart({Key? key, required this.expenses}) : super(key: key);

  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text(
            "Weekly Spending",
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.arrow_back)
              ),
              const Text(
                "Nov 10, 2019 - Nov 16, 2019",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.arrow_forward)
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 12    ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Bar(label: "Su", amountSpent: expenses[0], mostExpensive: mostExpensive),
              Bar(label: "Mo", amountSpent: expenses[1], mostExpensive: mostExpensive),
              Bar(label: "Tu", amountSpent: expenses[2], mostExpensive: mostExpensive),
              Bar(label: "We", amountSpent: expenses[3], mostExpensive: mostExpensive),
              Bar(label: "Th", amountSpent: expenses[4], mostExpensive: mostExpensive),
              Bar(label: "Fr", amountSpent: expenses[5], mostExpensive: mostExpensive),
              Bar(label: "Sa", amountSpent: expenses[6], mostExpensive: mostExpensive)
            ],
          ),
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({Key? key, required this.label, required this.amountSpent, required this.mostExpensive}) : super(key: key);

  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          "\$${amountSpent.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 14
          ),
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6)
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}