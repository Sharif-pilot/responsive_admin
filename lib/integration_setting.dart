import 'package:flutter/material.dart';

import 'app_drawer.dart';

class IntegrationSettingsScreen extends StatefulWidget {
  const IntegrationSettingsScreen({super.key});

  @override
  IntegrationSettingsScreenState createState() =>
      IntegrationSettingsScreenState();
}

class IntegrationSettingsScreenState extends State<IntegrationSettingsScreen> {
  Map<String, bool> integrations = {
    "Google Drive": true,
    "Dropbox": false,
    "GitHub": true,
    "Slack": false,
    "Stripe": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Integration Settings")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: integrations.keys.map((service) {
          final connected = integrations[service]!;
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: connected
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
                child: Icon(
                  connected ? Icons.check_circle : Icons.cancel,
                  color: connected ? Colors.green : Colors.red,
                ),
              ),
              title: Text(service,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  connected ? "Connected" : "Not Connected",
                  style: TextStyle(
                      color: connected ? Colors.green : Colors.red)),
              trailing: Switch(
                value: connected,
                onChanged: (val) {
                  setState(() {
                    integrations[service] = val;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${service} ${val ? "connected" : "disconnected"}"),
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
      drawer: AdminDrawer(currentRoute: '/integrations'),
    );
  }
}

