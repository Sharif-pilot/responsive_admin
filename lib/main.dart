import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_admin/content_screen.dart';
import 'package:responsive_admin/finance_screen.dart';
import 'package:responsive_admin/inbox_screen.dart';
import 'package:responsive_admin/login.dart';
import 'package:responsive_admin/permission.dart';
import 'package:responsive_admin/report_screen.dart';
import 'package:responsive_admin/role.dart';
import 'package:responsive_admin/settings.dart';
import 'package:responsive_admin/user_list.dart';

import 'activity_log_screen.dart';
import 'app_drawer.dart';
import 'create_profile.dart';
import 'integration_setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Dashboard',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color(0xFF1E1E2C),
      ),
      home: LoginScreen(key: const Key('login')),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/reports': (context) => ReportScreen(),
        '/activity': (context) => ActivityLogScreen(),
        '/integrations': (context) => IntegrationSettingsScreen(),
        '/inbox': (context) => InboxScreen(),
        '/finance': (context) => FinanceScreen(),
        '/content': (context) => ContentScreen(),
        '/permissions': (context) => PermissionScreen(),
        '/roles': (context) => RoleScreen(),
        '/users': (context) => UserListScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary cards
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCard("Users", Icons.people, Colors.blue),
                _buildCard("Revenue", Icons.attach_money, Colors.green),
                _buildCard("Orders", Icons.shopping_cart, Colors.orange),
                _buildCard("Reports", Icons.bar_chart, Colors.purple),
              ],
            ),
            const SizedBox(height: 20),

            // Charts
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text("Bar Chart", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: BarChartSample()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text("Pie Chart", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: PieChartSample()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text("Line Chart", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: LineChartSample()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text("Scatter Chart", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: ScatterChartSample()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}



// --- Chart Samples ---

class BarChartSample extends StatelessWidget {
  const BarChartSample({super.key});

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
  const PieChartSample({super.key});

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
  const LineChartSample({super.key});

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


