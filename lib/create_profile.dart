import 'package:flutter/material.dart';
import 'package:responsive_admin/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  final profile = {
    "name": "Sharif",
    "email": "sharif@example.com",
    "role": "Admin",
    "joined": "Jan 2025",
    "avatar": "https://i.pravatar.cc/150?img=3",
  };

    ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar + Name
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile["avatar"]!),
            ),
            SizedBox(height: 12),
            Text(profile["name"]!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(profile["role"]!,
                style: TextStyle(color: Colors.grey[600], fontSize: 16)),
            SizedBox(height: 20),

            // Info Cards
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.blueAccent),
                title: Text("Email"),
                subtitle: Text(profile["email"]!),
                trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.greenAccent),
                title: Text("Joined"),
                subtitle: Text(profile["joined"]!),
              ),
            ),
            SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.edit),
                  label: Text("Edit Profile"),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Edit profile clicked")),
                    );
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.logout),
                  label: Text("Logout"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Logged out")),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: AdminDrawer(currentRoute: '/profile'),
    );
  }
}
