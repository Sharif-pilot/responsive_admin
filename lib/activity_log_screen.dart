import 'package:flutter/material.dart';

import 'app_drawer.dart';

class ActivityLogScreen extends StatelessWidget {
  final List<Map<String,dynamic>>activities = [
    {
      "icon": Icons.login,
      "title": "User Login",
      "detail": "Sharif logged in from Kabul",
      "time": "09:00 AM"
    },
    {
      "icon": Icons.edit,
      "title": "Role Updated",
      "detail": "Admin role permissions changed",
      "time": "09:15 AM"
    },
    {
      "icon": Icons.delete,
      "title": "Record Deleted",
      "detail": "Invoice INV002 removed by Editor",
      "time": "09:30 AM"
    },
    {
      "icon": Icons.settings,
      "title": "Settings Changed",
      "detail": "Theme switched to Dark Mode",
      "time": "09:45 AM"
    },
  ];

    ActivityLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity Log")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: activities.length,
        itemBuilder: (context, i) {
          final activity = activities[i];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
                child: Icon(activity["icon"] as IconData, color: Colors.blueAccent),
              ),
              title: Text(activity["title"]!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(activity["time"]!),
              children: [
                Divider(),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(activity["detail"]!,
                      style: TextStyle(color: Colors.grey[700])),
                ),
              ],
            ),
          );
        },
      ),
      drawer: AdminDrawer(currentRoute: '/activity'),
    );
  }
}
