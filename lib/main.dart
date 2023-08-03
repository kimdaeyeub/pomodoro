import 'package:flutter/material.dart';
import 'package:pomodoro_app/features/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}
