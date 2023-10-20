import 'package:flutter/material.dart';
import 'package:money_tracker/models/expense.dart';
import 'package:money_tracker/widggets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                  color: Theme.of(context).colorScheme.error,
                  margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                  )),
              onDismissed: (direction) {
                onRemove(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]),
            ));
  }
}
