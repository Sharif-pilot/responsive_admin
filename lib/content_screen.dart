import 'package:flutter/material.dart';
import 'package:responsive_admin/app_drawer.dart';
class ContentScreen extends StatelessWidget {
  final items = ["Report.pdf", "Image.png", "Data.csv"];

    ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Content Manager")),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: items.length,
        itemBuilder: (context, i) => Card(
          child: InkWell(
            onTap: () {},
            child: Center(child: Text(items[i])),
          ),
        ),
      ),
      drawer: AdminDrawer(currentRoute: '/content'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload),
        onPressed: () {},
      ),
    );
  }
}
