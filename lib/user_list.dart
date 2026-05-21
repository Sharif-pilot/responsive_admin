import 'package:flutter/material.dart';
import 'package:responsive_admin/app_drawer.dart'; 
class UserListScreen extends StatelessWidget {
  final users = [
    {"name": "Alice", "role": "Admin"},
    {"name": "Bob", "role": "Editor"},
    {"name": "Charlie", "role": "Viewer"},
  ];

    UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Role")),
            DataColumn(label: Text("Actions")),
          ],
          rows: users.map((u) => DataRow(cells: [
            DataCell(Text(u["name"]!)),
            DataCell(Text(u["role"]!)),
            DataCell(Row(children: [
              IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            ])),
          ])).toList(),
        ),
      ),
      drawer: AdminDrawer(currentRoute: '/users'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
