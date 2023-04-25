import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class LandlordDashboard extends StatelessWidget {
  final data = [
    Expense('Rent', 5000, charts.MaterialPalette.blue.shadeDefault, 1000, 5000,
        8000),
    Expense('Utilities', 2500, charts.MaterialPalette.red.shadeDefault, 1200,
        6000, 10000),
    Expense('Insurance', 300, charts.MaterialPalette.green.shadeDefault, 800,
        4000, 5000),
  ];

  final List<Map<String, dynamic>> properties = [
    {
      'id': 1,
      'name': 'Sunset Apartments',
      'address': '123 Main St, City A',
      'numUnits': 10,
      'rentPerUnit': 1000,
      'occupancyRate': 0.8,
      'expenses': 5000,
      'netIncome': 8000,
    },
    {
      'id': 2,
      'name': 'Greenwood Villas',
      'address': '456 Oak St, City B',
      'numUnits': 12,
      'rentPerUnit': 1200,
      'occupancyRate': 0.9,
      'expenses': 6000,
      'netIncome': 10000,
    },
    {
      'id': 3,
      'name': 'Magnolia Estates',
      'address': '789 Pine St, City C',
      'numUnits': 8,
      'rentPerUnit': 800,
      'occupancyRate': 0.7,
      'expenses': 4000,
      'netIncome': 5000,
    },
    {
      'id': 4,
      'name': 'Saddlewood Manor',
      'address': '321 Maple St, City D',
      'numUnits': 6,
      'rentPerUnit': 700,
      'occupancyRate': 0.6,
      'expenses': 3000,
      'netIncome': 4200,
    },
    {
      'id': 5,
      'name': 'Bayside Terrace',
      'address': '987 Ocean Blvd, City E',
      'numUnits': 16,
      'rentPerUnit': 1500,
      'occupancyRate': 0.85,
      'expenses': 8000,
      'netIncome': 12000,
    },
  ];

  LandlordDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text('Landlord Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Properties',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: properties.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(properties[index]['name']),
                  subtitle: Text(properties[index]['address']),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Monthly Property Financial Summary',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: charts.BarChart(
                  [
                    charts.Series<Expense, String>(
                      id: 'Rent Per Unit',
                      domainFn: (Expense expense, _) => expense.category,
                      measureFn: (Expense expense, _) => expense.rentPerUnit,
                      colorFn: (Expense expense, _) => expense.color,
                      data: data,
                    ),
                    charts.Series<Expense, String>(
                      id: 'Expenses',
                      domainFn: (Expense expense, _) => expense.category,
                      measureFn: (Expense expense, _) => expense.expenses,
                      colorFn: (Expense expense, _) => expense.color,
                      data: data,
                    ),
                    charts.Series<Expense, String>(
                      id: 'Net Income',
                      domainFn: (Expense expense, _) => expense.category,
                      measureFn: (Expense expense, _) => expense.netIncome,
                      colorFn: (Expense expense, _) => expense.color,
                      data: data,
                    )
                  ],
                  animate: true,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        tooltip: 'Add Property',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Expense {
  final String category;
  final int amount;
  final charts.Color color;
  final int rentPerUnit;
  final int expenses;
  final int netIncome;

  Expense(this.category, this.amount, this.color, this.rentPerUnit,
      this.expenses, this.netIncome);
}
