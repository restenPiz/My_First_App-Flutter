
// ignore_for_file: prefer_const_constructors

// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Scaffold(
        appBar: AppBar(
        title: Text('Todas as Tarefas'),
      ),
      body: Center(
        child: Text('Aqui estão todas as tarefas'),
      ),
      ),
    );
  }
}
