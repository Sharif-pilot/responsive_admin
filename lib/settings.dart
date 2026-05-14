import 'package:flutter/material.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          bottom: TabBar(tabs: [
            Tab(text: "General"),
            Tab(text: "Security"),
            Tab(text: "Notifications"),
          ]),
        ),
        body: TabBarView(children: [
          Center(child: Text("General Settings Form")),
          Center(child: Text("Security Options")),
          Center(child: Text("Notification Preferences")),
        ]),
      ),
    );
  }
}
