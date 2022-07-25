import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/models/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListExpense extends StatefulWidget {
  const ListExpense({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  State<ListExpense> createState() => _ListExpenseState();
}

class _ListExpenseState extends State<ListExpense> {
  @override
  Widget build(BuildContext context) {
    List<Widget> expenseList = [];
    for (var expense in widget.category.expenses) {
      expenseList.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 2)
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                expense.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                "\$${expense.cost.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        )
      );
    }
    return Column(children: expenseList);
  }
}