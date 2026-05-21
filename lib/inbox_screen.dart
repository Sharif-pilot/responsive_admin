import 'package:flutter/material.dart';
import 'package:responsive_admin/app_drawer.dart';
import 'package:flutter/material.dart';


class InboxScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      "from": "Admin",
      "subject": "System Update",
      "unread": true,
      "body": "Dear user,\n\nWe have updated the system with new features.\nPlease check the dashboard for details.\n\nRegards,\nAdmin Team"
    },
    {
      "from": "Support",
      "subject": "Ticket Resolved",
      "unread": false,
      "body": "Hello,\n\nYour support ticket #123 has been resolved.\nThank you for your patience.\n\nSupport Team"
    },
  ];

  InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inbox")),
      drawer: const AdminDrawer(currentRoute: '/inbox'),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, i) {
          final msg = messages[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(
                msg["unread"]! ? Icons.mark_email_unread : Icons.email,
                color: msg["unread"]! ? Colors.blueAccent : Colors.grey,
              ),
              title: Text(msg["subject"]!,
                  style: TextStyle(
                      fontWeight:
                      msg["unread"]! ? FontWeight.bold : FontWeight.normal)),
              subtitle: Text("From: ${msg["from"]}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MessageDetailScreen(message: msg),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MessageDetailScreen extends StatelessWidget {
  final Map<String, dynamic> message;

  const MessageDetailScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message["subject"]!)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("From: ${message["from"]}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Text( 
                  message["body"]!,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

