import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({super.key});

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color? color = Colors.blue;

  _showColorDialog(BuildContext context) async {
    color = null;
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Very important question"),
            content: Text("Please choose a color"),
            actions: [
              TextButton(
                  onPressed: () {
                    color = Colors.red;
                    Navigator.pop(context, color);
                  },
                  child: const Text("Red")),
              TextButton(
                  onPressed: () {
                    color = Colors.green;
                    Navigator.pop(context, color);
                  },
                  child: const Text("Green")),
              TextButton(
                  onPressed: () {
                    color = Colors.blue;
                    Navigator.pop(context, color);
                  },
                  child: const Text("Blue")),
            ],
          );
        });
    setState(() {
      color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text("Navigation Dialog Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showColorDialog(context);
          },
          child: const Text("Change color"),
        ),
      ),
    );
  }
}
