import 'package:first_app/screens/index.dart';
import 'package:flutter/material.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'index',
    routes: {
      'index':(context) => indexScreen(),
    },
  ));
}