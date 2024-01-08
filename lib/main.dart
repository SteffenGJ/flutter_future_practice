import 'package:flutter/material.dart';
import "package:flutter_future/future_page.dart";
import 'package:flutter_future/geolocation.dart';
import 'package:flutter_future/navigation_dialog.dart';
import 'package:flutter_future/navigation_first.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Future Demo",
      home: NavigationDialog(),
    );
  }
}
