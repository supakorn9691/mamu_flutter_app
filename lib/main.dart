import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MaMuApp());
}

class MaMuApp extends StatelessWidget {
  const MaMuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaMu – Mutelu Prayer App',
      theme: ThemeData(
        // If Mitr font files are not added yet, Flutter will fallback to default fonts gracefully.
        fontFamily: 'Mitr',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
