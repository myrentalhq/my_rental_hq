import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';

class RentalHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('My Rental HQ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'Spending per Property',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            Container(
              height: 250,
              padding: EdgeInsets.all(16),
              child: SpendingChart.create(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle add property functionality here
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Property'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[850]),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle manage property functionality here
                  },
                  icon: Icon(Icons.manage_accounts),
                  label: Text('Manage Property'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[850]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SpendingChart extends StatelessWidget {
  final List<charts.Series<PropertySpending, String>> seriesList;
  final bool animate;

  SpendingChart(this.seriesList, {required this.animate});

  factory SpendingChart.create() {
    return SpendingChart(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 14,
            color: charts.ColorUtil.fromDartColor(Colors.white),
          ),
        ),
      ),
    );
  }

  static List<charts.Series<PropertySpending, String>> _createSampleData() {
    final data = [
      PropertySpending('Property 1', 50),
      PropertySpending('Property 2', 30),
      PropertySpending('Property 3', 70),
    ];

    return [
      charts.Series<PropertySpending, String>(
        id: 'Spending',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PropertySpending spending, _) => spending.property,
        measureFn: (PropertySpending spending, _) => spending.spending,
        data: data,
      )
    ];
  }
}

class PropertySpending {
  final String property;
  final int spending;

  PropertySpending(this.property, this.spending);
}
