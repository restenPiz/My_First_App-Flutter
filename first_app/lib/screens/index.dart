// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:first_app/screens/allTasksScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  //Inicio do metodo responsavel por fazer o post na aplicacao
  Future<void> _storeTask() async {
    const String apiUrl = 'http://127.0.0.1:8000/api/storeMember';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Name': _nameController.text,
        'Surname': _surnameController.text,
        'Task': _taskController.text,
      }),
    );

    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      _nameController.clear();
      _surnameController.clear();
      _taskController.clear();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao inserir a tarefa!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 124, 235),
        title: Row(
          children: [
            Expanded(child: Text('Adicionar Tarefa!',)),
          ],
        ),
      ),
      
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 44, 14, 115),
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
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 181, 163, 231),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Digite o seu nome:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(height: 15),
                    TextField(
                      controller: _surnameController,
                      decoration: InputDecoration(
                        labelText: 'Apelido',
                        hintText: 'Digite o seu apelido:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(height: 15),
                    TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        labelText: 'Tarefa',
                        hintText: 'Digite a sua tarefa:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(height: 15),
                    ElevatedButton(
                      onPressed: _storeTask,
                      child: Text('Adicionar Tarefa'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}