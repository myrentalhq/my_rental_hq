import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/rendering.dart';

class TenantDashboard extends StatelessWidget {
  const TenantDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for the expenses graph
    final data = [
      Expense('Rent', 1000, charts.MaterialPalette.blue.shadeDefault),
      Expense('Utilities', 200, charts.MaterialPalette.red.shadeDefault),
      Expense('Insurance', 50, charts.MaterialPalette.green.shadeDefault),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading:false,
        title: const Text('Tenant Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Add onPressed functionality for the chat button
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add onPressed functionality for the notifications button
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Expenses', style: TextStyle(fontSize: 20.0)),
          SizedBox(
            height: 200,
            child: charts.BarChart(
              [
                charts.Series<Expense, String>(
                  id: 'Expenses',
                  domainFn: (Expense expense, _) => expense.category,
                  measureFn: (Expense expense, _) => expense.amount,
                  colorFn: (Expense expense, _) => expense.color,
                  data: data,
                )
              ],
              animate: true,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Upcoming Rent Payment', style: TextStyle(fontSize: 20.0)),
          // Add a widget to display the upcoming rent payment details

          const SizedBox(height: 16.0),
          const Text('Maintenance Requests', style: TextStyle(fontSize: 20.0)),
          // Add a widget to display the tenant's maintenance requests

          const SizedBox(height: 16.0),
          const Text('Documents', style: TextStyle(fontSize: 20.0)),
          // Add a widget to display the tenant's documents, like the lease agreement
        ],
      ),
    );
  }
}

class Expense {
  final String category;
  final int amount;
  final charts.Color color;

  Expense(this.category, this.amount, this.color);
}
