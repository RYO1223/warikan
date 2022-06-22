import 'package:flutter/material.dart';
import 'package:warikan/src/features/add_payment/add_payment.dart';
import 'package:warikan/src/features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (BuildContext context) => const HomeScreen(),
        '/add_payment': (BuildContext context) => const AddPayment(),
      },
    );
  }
}
