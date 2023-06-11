// ignore_for_file: file_names, prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<dynamic> produtos = [];

  Future<void> _getProdutos() async {
    final String apiUrl = 'http://localhost:8000/api/allTask';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        produtos = data;
      });
    } else {
      throw Exception('Falha ao carregar os produtos');
    }
  }

  @override
  void initState() {
    super.initState();
    _getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int index) {
          final produto = produtos[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color.fromARGB(255, 235, 235, 235),
              child: ListTile(
                //leading: Icon(Icons.check_box),
                title: Text(produto['Title']),
                subtitle: Text(produto['Description']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Eliminar Tarefa'),
                          content: Text('Tem certeza que deseja eliminar essa tarefa?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Eliminar'),
                              onPressed: () {
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
