import 'package:budget_app/data/categories_data.dart';
import 'package:budget_app/data/expense_data.dart';
import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/widgets/bar_chart.dart';
import 'package:budget_app/widgets/list_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            floating: true,
            pinned: true,
            expandedHeight: 75,
            leading: IconButton(
              onPressed: () {}, 
              icon: const Icon(
                Icons.settings, 
                size: 26,
              )
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "Simple Budget",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              centerTitle: true,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {}, 
                icon: const Icon(
                  Icons.add, 
                  size: 26,
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.all(10),
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
                    child: BarChart(expenses: weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmountSpent = 0;
                  for (var item in category.expenses) {
                    totalAmountSpent += item.cost;
                  }

                  return ListCategories(category: category, totalAmountSpent: totalAmountSpent);
                }
              },
              childCount: 1 + categories.length
            )
          )
        ],
      ),
    );
  }
}