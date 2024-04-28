import 'package:come_back/product.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductView(),
    );
  }
}