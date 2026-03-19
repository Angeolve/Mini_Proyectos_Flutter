import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Chatbot Inscripciones")),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              print("Intentando abrir chat...");
              try {
                var conversationObject = {
                  'appId': '25ec2b6df2dc941c122d59f6385034860',
                };
                var response = await KommunicateFlutterPlugin.buildConversation(
                  conversationObject,
                );
                print("Success: $response");
              } catch (e) {
                print("Error: $e");
              }
            },
            child: const Text("Abrir Chat"),
          ),
        ),
      ),
    );
  }
}
