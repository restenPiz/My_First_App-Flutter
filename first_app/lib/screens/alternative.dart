// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class alternativeScreen extends StatelessWidget {
  const alternativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 154, 124, 235),
          title: Row(
            children: [
              Expanded(child: Text('Contact')),
            ],
          ),
          actions: [
            Padding(padding: EdgeInsets.all(10),
            child:Icon(Icons.search),
            ),
          ],
        ),
        body: Center(
          child: Container(
            width: 500,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 181, 163, 231),  
            ),    
            child: ListView(
              children: [
                ListTile(
                  title: Text('Mauro Peniel'),
                  subtitle: Text('Hello World'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/dif.jpg'),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text('Ola Mundo'),
                  subtitle: Text('Hello World'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/dif.jpg'),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text('Ola Mundo'),
                  subtitle: Text('Hello World'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/dif.jpg'),
                  ),
                ),
                const Divider(),
              ],
            ),      
          ),
        ),
      ),
    );
  }
}