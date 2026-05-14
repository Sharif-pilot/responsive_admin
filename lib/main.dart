import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Dashboard',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFF1E1E2C),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard("Bar Chart", BarChartSample()),
            SizedBox(height: 20),
            _buildCard("Pie Chart", PieChartSample()),
            SizedBox(height: 20),
            _buildCard("Line Chart", LineChartSample()),
            SizedBox(height: 20),
            _buildCard("Scatter Chart", ScatterChartSample()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, Widget chart) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Color(0xFF2A2A3D),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 12),
            SizedBox(height: 200, child: chart),
          ],
        ),
      ),
    );
  }
}

// --- Chart Samples ---

class BarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.blueAccent)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.greenAccent)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: Colors.purpleAccent)]),
        ],
      ),
    );
  }
}

class PieChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(sections: [
        PieChartSectionData(value: 40, color: Colors.blueAccent, title: "40%"),
        PieChartSectionData(value: 30, color: Colors.greenAccent, title: "30%"),
        PieChartSectionData(value: 30, color: Colors.purpleAccent, title: "30%"),
      ]),
    );
  }
}

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 5),
              FlSpot(4, 3), 
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            barWidth: 4,
            dotData: FlDotData(show: true),
          ),
        ],
        titlesData: FlTitlesData(show: true),
        gridData: FlGridData(show: true),
      ),
    );
  }
}


class ScatterChartSample extends StatelessWidget {
  const ScatterChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        scatterSpots: [
          ScatterSpot(2, 3, dotPainter: FlDotCirclePainter(
            radius: 6,
            color: Colors.blueAccent,
          )),
          ScatterSpot(4, 5, dotPainter: FlDotCirclePainter(
            radius: 6,
            color: Colors.greenAccent,
          )),
          ScatterSpot(6, 7, dotPainter: FlDotCirclePainter(
            radius: 6,
            color: Colors.purpleAccent,
          )),
        ],
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 10,
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
      ),
    );
  }
}


