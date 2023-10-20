import 'package:flutter/material.dart';
import 'package:money_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return <ExpenseBucket>[
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    return buckets.fold(
        0,
        (previousValue, element) => previousValue =
            previousValue < element.TotalSum
                ? element.TotalSum
                : previousValue);
  }

  @override
  Widget build(BuildContext context)
  {
    return Placeholder();
  }
}
