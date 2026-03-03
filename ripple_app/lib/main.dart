import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("InkWell Ripple Example")),
        body: Center(
          child: InkWell(
            // Cuando el usuario toca el widget
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Tap')));
            },

            // Widget hijo
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Flat Button', style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ),
    );
  }
}
