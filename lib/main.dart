import 'package:chat_app/pages/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.blue)
      ),
      home: ChatScreen(),
    );
  }
}