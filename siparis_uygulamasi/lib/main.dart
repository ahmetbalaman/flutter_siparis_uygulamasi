import 'package:flutter/material.dart';
import 'package:siparis_uygulamasi/screens/yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siparis Uygulamasi',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const FoodPage(),
    );
  }
}
