import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'برنج‌یار',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF071C13),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFEAB308),
          secondary: Color(0xFF10B981),
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.eco, color: Color(0xFFEAB308), size: 80),
              SizedBox(height: 20),
              Text(
                'برنج‌یار',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'نسخه آزمایشی در حال ساخت...',
                style: TextStyle(color: Color(0xFFA7F3D0), fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
