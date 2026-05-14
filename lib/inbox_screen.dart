import 'package:flutter/material.dart';
class InboxScreen extends StatelessWidget {
  final List<Map<String,dynamic>>messages = [
    {"from": "Admin", "subject": "System Update", "unread": true},
    {"from": "Support", "subject": "Ticket Resolved", "unread": false},
  ];

    InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inbox")),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(messages[i]["unread"]! ? Icons.mark_email_unread : Icons.email),
          title: Text(messages[i]["subject"]!),
          subtitle: Text("From: ${messages[i]["from"]}"),
          onTap: () {},
        ),
      ),
    );
  }
}
