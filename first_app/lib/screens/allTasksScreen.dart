// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class AllTasksScreen extends StatefulWidget {
  @override
  _AllTasksScreenState createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        //Inicio do appBar
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 205, 205, 205),
          title: Text(
            'Emma - App',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          //centerTitle: true,
        ),

        //Inicio do body do app
        body: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  Container(
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
                                leading: Icon(Icons.task),
                                title: Text('Primeira Tarefa'),
                                subtitle: Text('Olá Mundo!'),
                              ),
                            ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 235, 235, 235),
                    child: Center(
                      child: Text('Página 2'),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 235, 235, 235),
                    child: Center(
                      child: Text('Página 3'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Inicio do menu inferior do app
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 205, 205, 205),
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Adicionar Tarefa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Meu Perfil',
            ),
          ],
        ),
      ),
    );
  }
}