import 'package:flutter/material.dart';
import 'package:responsive_admin/app_drawer.dart';
class RoleScreen extends StatelessWidget {
  final roles = ["Admin", "Editor", "Viewer"];

    RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Role Management")),
      body: ListView.builder(
        itemCount: roles.length,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: Icon(Icons.security, color: Colors.blueAccent),
            title: Text(roles[i]),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add new role clicked")));
        },
      ),
      drawer: AdminDrawer(currentRoute: '/roles'),
    );
  }
}

