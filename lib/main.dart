import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const GetFitApp());
}

class GetFitApp extends StatelessWidget {
  const GetFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AestheticDashboard(),
    );
  }
}