import 'package:carbon_footprint_app/components/navbar.dart';
import 'package:carbon_footprint_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() {
  Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: NavBar(),
        ),
      ),
    );
  }
}
