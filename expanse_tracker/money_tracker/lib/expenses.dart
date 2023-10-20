import 'package:flutter/material.dart';
import 'package:money_tracker/widggets/expenses_list/expenses_list.dart';
import 'package:money_tracker/models/expense.dart';
import 'package:money_tracker/widggets/expenses_list/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registratedExpanses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Corn",
        amount: 5.0,
        date: DateTime.now(),
        category: Category.food)
  ];

  void _openAddOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (item) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registratedExpanses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registratedExpanses.indexOf(expense);
    setState(() {
      _registratedExpanses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense has been deleted"),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registratedExpanses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found"),
    );

    if (_registratedExpanses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registratedExpanses,
        onRemove: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Demo of expense app"), actions: [
        IconButton(onPressed: _openAddOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(children: [Text('Graph'), Expanded(child: mainContent)]),
    );
  }
}
