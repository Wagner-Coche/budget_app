import 'package:budget_app/helpers/get_color.dart';
import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/screens/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListCategories extends StatefulWidget {
  const ListCategories({Key? key, required this.category, required this.totalAmountSpent}) : super(key: key);

  final Category category;
  final double totalAmountSpent;

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(category: widget.category)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 100,
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
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.category.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "\$${(widget.category.maxAmount - widget.totalAmountSpent).toStringAsFixed(2)} / \$${widget.category.maxAmount}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double maxBarWidth = constraints.maxWidth;
                  final double percent = (widget.category.maxAmount - widget.totalAmountSpent) / widget.category.maxAmount;
                  double barWidth = maxBarWidth * percent;
    
                  if (barWidth < 0) {
                    barWidth = 0;
                  }
    
                  return Stack(
                    children: <Widget>[
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: barWidth,
                        decoration: BoxDecoration(
                          color: getColor(context, percent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )
                    ],
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}