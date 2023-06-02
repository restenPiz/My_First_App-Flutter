// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class indexScreen extends StatelessWidget {
  const indexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact'),
          leading: Icon(Icons.search),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,  
            ),    
            child: ListView(
              children: [
                ListTile(
                  title: Text('Ola Mundo'),
                  subtitle: Text('Hello World'),
                  leading: Icon(Icons.ac_unit_outlined),
                ),
              ],
            ),      
          ),
        ),
      ),
    );
  }
}