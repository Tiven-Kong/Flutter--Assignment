import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food(Icons.lunch_dining),
  travel(Icons.flight_takeoff),
  leisure(Icons.movie),
  work(Icons.work);

  String get name {
    switch (this) {
      case Category.food:
        return 'Food';
      case Category.travel:
        return 'Travel';
      case Category.leisure:
        return 'Entertainment';
      case Category.work:
        return 'Work';
    }
  }
  final IconData icon;

  const Category(this.icon);
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  @override
  String toString() {
    return "Expense $title , amount $amount";
  }
}
