import 'package:budget_app/helpers/get_color.dart';
import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/widgets/list_expense.dart';
import 'package:budget_app/widgets/radial_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    for (var item in widget.category.expenses) {
      totalAmountSpent += item.cost;
    }
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back)
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Center(
                child: Text(
                  "\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(child: ListExpense(category: widget.category))
          ],
        ),
      ),
    );
  }
}