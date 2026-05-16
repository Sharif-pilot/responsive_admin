import 'package:flutter/material.dart';
class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  PermissionScreenState createState() => PermissionScreenState();
}

class PermissionScreenState extends State<PermissionScreen> {
  final roles = ["Admin", "Editor", "Viewer"];
  final permissions = ["Read", "Write", "Delete"];
  Map<String, Map<String, bool>> rolePermissions = {
    "Admin": {"Read": true, "Write": true, "Delete": true},
    "Editor": {"Read": true, "Write": true, "Delete": false},
    "Viewer": {"Read": true, "Write": false, "Delete": false},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Permission Management")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text("Role")),
            ...permissions.map((p) => DataColumn(label: Text(p))).toList(),
          ],
          rows: roles.map((role) {
            return DataRow(cells: [
              DataCell(Text(role)),
              ...permissions.map((perm) {
                return DataCell(Switch(
                  value: rolePermissions[role]![perm]!,
                  onChanged: (val) {
                    setState(() => rolePermissions[role]![perm] = val);
                  },
                ));
              }).toList(),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
