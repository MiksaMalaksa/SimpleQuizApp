import 'package:flutter/material.dart';
import 'package:money_tracker/expenses.dart';
import 'package:flutter/services.dart';

var keyColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var keyBlackThemeColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: keyBlackThemeColor,
      cardTheme: const CardTheme().copyWith(
          color: keyBlackThemeColor.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: keyBlackThemeColor.primaryContainer,
              foregroundColor: keyBlackThemeColor.onPrimaryContainer)),
    ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: keyBlackThemeColor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: keyColorScheme.onPrimaryContainer,
          foregroundColor: keyColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: keyColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: keyColorScheme.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: keyColorScheme.onSecondaryContainer,
                fontSize: 14))),
    home: Expenses(),
  ));
}
