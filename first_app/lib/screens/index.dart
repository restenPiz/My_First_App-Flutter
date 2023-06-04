// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class indexScreen extends StatefulWidget {
  const indexScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _indexScreenState createState() => _indexScreenState();
}

class _indexScreenState extends State<indexScreen> {

  //Declarando as varivies dos inputs que estamos a capturar
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _taskController=TextEditingController();
  final TextEditingController _surnameController=TextEditingController();

  //Declarando um metodo que vai levar o unpressed do butao
   Future<void> _storeTask() async {
    const String apiUrl = 'http://localhost:8000/api/storeTask';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': _nameController.text,
        'surname': _surnameController.text,
        'task': _taskController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Produto inserido com sucesso
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('A tarefa foi inserida com sucesso!')),
      );
      _nameController.clear();
      _surnameController.clear();
      _taskController.clear();
    } else {
      // Algo deu errado ao inserir o produto
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao inserir a tarefa!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 154, 124, 235),
          title: Row(
            children: [
              Expanded(child: Text('Adicionar Tarefa!')),
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
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration:InputDecoration(
                          labelText: 'Nome',
                          hintText:'Digite o seu nome:',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(height: 15,),
                      TextField(
                        controller: _surnameController,
                        decoration:InputDecoration(
                          labelText: 'Apelido',
                          hintText:'Digite o seu apelido:',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(height: 15,),
                      TextField(
                        controller: _taskController,
                        decoration:InputDecoration(
                          labelText: 'Tarefa',
                          hintText:'Digite a sua tarefa:',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(height: 15,),
                      ElevatedButton(onPressed: _storeTask, child: Text('Adicionar')),
                    ],
                  ),
                ),
              ],
            ),      
          ),
        ),
      ),
    );
  }
}