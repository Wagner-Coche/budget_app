import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/data/expense_data.dart';

List<Category> categories = [
  Category(name: 'Food', maxAmount: 450, expenses: generateExpenses),
  Category(name: 'Housing', maxAmount: 1000, expenses: generateExpenses),
  Category(name: 'Clothing', maxAmount: 500, expenses: generateExpenses),
  Category(name: 'Utilities', maxAmount: 600, expenses: generateExpenses),
  Category(name: 'Entertainment', maxAmount: 330, expenses: generateExpenses),
  Category(name: 'Transportation', maxAmount: 500, expenses: generateExpenses)
];