import 'package:flutter/material.dart';
import 'package:weathery/presentation/views/navbar/bottom_navbar/bottom_navigationbar.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BottomNavigation()
    );
  }
}