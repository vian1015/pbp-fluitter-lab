import 'package:flutter/material.dart';


class User {
    static List<BudgetData> budgetData = [];
}

class BudgetData {
    String? title;
    int? amount;
    String? type;
    String? date;

    BudgetData(this.title, this.amount, this.type, this.date);
}