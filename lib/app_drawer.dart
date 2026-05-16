import 'package:flutter/material.dart';
class AdminDrawer extends StatelessWidget {
  final String currentRoute;

  const AdminDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text("Admin Menu", style: TextStyle(color: Colors.white)),
          ),
          _buildNavItem(context, Icons.dashboard, "Dashboard", '/dashboard'),
          _buildNavItem(context, Icons.person, "Profile", '/profile'),
          _buildNavItem(context, Icons.bar_chart, "Reports", '/reports'),
          _buildNavItem(context, Icons.history, "Activity Log", '/activity'),
          _buildNavItem(context, Icons.settings, "Integrations", '/integrations'),
          _buildNavItem(context, Icons.mail, "Inbox", '/inbox'),
          _buildNavItem(context, Icons.attach_money, "Finance", '/finance'),
          _buildNavItem(context, Icons.folder, "Content", '/content'),
          _buildNavItem(context, Icons.lock, "Permissions", '/permissions'),
          _buildNavItem(context, Icons.security, "Roles", '/roles'),
          _buildNavItem(context, Icons.people, "Users", '/users'),
          _buildNavItem(context, Icons.tune, "Settings", '/settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, String route) {
    final bool isActive = currentRoute == route;
    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.blueAccent : Colors.grey),
      title: Text(title,
          style: TextStyle(
              color: isActive ? Colors.blueAccent : Colors.white,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        } else {
          Navigator.pop(context); // close drawer if already active
        }
      },
    );
  }
}
