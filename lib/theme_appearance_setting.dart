import 'package:flutter/material.dart';

class ThemeAppearanceScreen extends StatefulWidget {
  const ThemeAppearanceScreen({super.key});

  @override
  ThemeAppearanceScreenState createState() => ThemeAppearanceScreenState();
}

class ThemeAppearanceScreenState extends State<ThemeAppearanceScreen> {
  bool _isDarkMode = false;
  Color _accentColor = Colors.blueAccent;
  double _fontSize = 16;

  final accentOptions = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.redAccent,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme & Appearance")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: SwitchListTile(
                title: Text("Dark Mode"),
                subtitle: Text(_isDarkMode ? "Enabled" : "Disabled"),
                value: _isDarkMode,
                onChanged: (val) => setState(() => _isDarkMode = val),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                title: Text("Accent Color"),
                subtitle: Row(
                  children: accentOptions.map((c) {
                    return GestureDetector(
                      onTap: () => setState(() => _accentColor = c),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: c,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _accentColor == c ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(title: Text("Font Size")),
                  Slider(
                    min: 12,
                    max: 24,
                    divisions: 6,
                    value: _fontSize,
                    label: "${_fontSize.toInt()}",
                    onChanged: (val) => setState(() => _fontSize = val),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: _accentColor),
              child: Text("Apply Settings", style: TextStyle(fontSize: _fontSize)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Settings applied with demo data")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
