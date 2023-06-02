// ignore_for_file: prefer_const_constructors

import 'package:first_app/screens/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'index',
    routes: {
      'index':(context) => indexScreen(),
    },
  ));
}