
// ignore_for_file: prefer_const_constructors

// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
          title: Text('Todas as Tarefas',
          style: TextStyle(
            color: Colors.black,
          ),),
          elevation: 0,
        ),
        drawer: Drawer(
        backgroundColor: Colors.amber,
        child: ListView(
          children: [
            ListTile(
              title: Text('Todas as Tarefas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllTasksScreen()),
                );
              },
            ),
          ],
        ),),
        body: Container(
          color: Color.fromARGB(255, 235, 235, 235),
        ),
      ),
    );
  }
}
