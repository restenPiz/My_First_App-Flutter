// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:first_app/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'Task.dart';
import 'addTask.dart';
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
            //SizedBox(height: 10),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  //Container(),

                  //Inicio dos widgets instanciados em outros arquivos
                  Task(),
                  addTask(),
                  Profile(),
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