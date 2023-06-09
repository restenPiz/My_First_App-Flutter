// ignore_for_file: unused_field, file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class addTask extends StatefulWidget {
  const addTask({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _addTaskState createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {

    //Inicio das variaveis
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  //Inicio do metodo submit 
  Future<void> _storeTask() async {
    const String apiUrl = 'http://127.0.0.1:8000/api/storeMember';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Title': _titleController.text,
        'Description': _descriptionController.text,
        'Date': _dateController.text,
      }),
    );

    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      _titleController.clear();
      _descriptionController.clear();
      _dateController.clear();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao inserir a tarefa!')),
      );
    }
  }

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
                  onPressed:_storeTask,
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