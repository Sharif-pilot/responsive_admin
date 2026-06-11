import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'app_drawer.dart';

class ReportScreen extends StatelessWidget {
  final reportData = [
    {"date": "2026-05-01", "sales": 1200, "orders": 45},
    {"date": "2026-05-02", "sales": 980, "orders": 38},
    {"date": "2026-05-03", "sales": 1500, "orders": 52},
  ];

    ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reports")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSummaryCard("Total Sales", "\$3680", Colors.blueAccent),
                _buildSummaryCard("Total Orders", "135", Colors.greenAccent),
              ],
            ),
            SizedBox(height: 20),

            // Line Chart
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Sales Trend", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: LineChart(_lineChartData())),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Data Table
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Date")),
                    DataColumn(label: Text("Sales")),
                    DataColumn(label: Text("Orders")),
                  ],
                  rows: reportData.map((row) {
                    return DataRow(cells: [
                      DataCell(Text(row["date"].toString())),
                      DataCell(Text("\$${row["sales"]}")),
                      DataCell(Text(row["orders"].toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AdminDrawer(currentRoute: '/reports'),
    );
  }

  Widget _buildSummaryCard(String title, String value, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  LineChartData _lineChartData() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 1200),
            FlSpot(2, 980),
            FlSpot(3, 1500),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
          ),
          barWidth: 4,
          dotData: FlDotData(show: true),
        ),
      ],
      titlesData: FlTitlesData(show: true),
      gridData: FlGridData(show: true),
    );
  }
}
   