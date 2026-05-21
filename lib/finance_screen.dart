import 'package:flutter/material.dart';
import 'package:responsive_admin/app_drawer.dart';
class FinanceScreen extends StatelessWidget {
  final invoices = [
    {"id": "INV001", "status": "Paid"},
    {"id": "INV002", "status": "Pending"},
  ];

    FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Invoices")),
      body: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            title: Text("Invoice ${invoices[i]["id"]}"),
            subtitle: Text("Status: ${invoices[i]["status"]}"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
      drawer: AdminDrawer(currentRoute: '/finance'),
    );
  }
}

