import 'dart:math';

import 'package:budget_app/models/expense_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<Expense> expenses = [
    Expense(name: 'Item 0', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 1', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 2', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 3', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 4', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];

  return expenses;
}

get generateExpenses => _generateExpenses();