import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter AP2',
      theme: ThemeData(primarySwatch: Colors.pink, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
