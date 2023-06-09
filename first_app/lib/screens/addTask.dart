// ignore_for_file: unused_field, file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class addTask extends StatelessWidget {

    //Inicio das variaveis
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 235, 235, 235),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                    hintText: 'Titulo da tarefa',
                    border: OutlineInputBorder(),
                  ),
                  controller: _titleController,
                ),
                Container(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Descricao',
                    hintText: 'Descricao',
                    border: OutlineInputBorder(),
                  ),
                  controller: _descriptionController,
                ),
                Container(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Data',
                    hintText: 'Ex: 11/09/2002',
                    border: OutlineInputBorder(),
                  ),
                  controller: _dateController,
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Adicionar Tarefa')
                ),
              ],
            ),
          ),
        ],
      ),
    );
                  
  }
}