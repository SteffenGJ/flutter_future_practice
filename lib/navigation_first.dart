import 'package:flutter/material.dart';
import 'package:flutter_future/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue;

  _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavigationSecond()));
    setState(() {
      color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text("Navigation First Screen")),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                _navigateAndGetColor(context);
              },
              child: const Text("GChange color"))),
    );
  }
}
