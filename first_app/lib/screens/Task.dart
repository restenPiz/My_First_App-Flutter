// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(255, 235, 235, 235),
      child: ListView(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16), // Espaçamento esquerdo e direito
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color.fromARGB(255, 235, 235, 235),
                child: ListTile(
                  leading: Icon(Icons.check_box),
                  title: Text('Primeira Tarefa'),
                  subtitle: Text('Eu sou Mauro Peniel!'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}