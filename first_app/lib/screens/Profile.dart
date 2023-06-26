// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Inicio do appBar do meu app
        appBar: AppBar(
          title: Text('Profile'),
        ),
        //Inicio do body que vai instanciar um outro widget externo
        body: Profile(),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      //Inicio da widget Stack que permite agrupar mais widgets dentro da Stack
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 900,
            color: const Color.fromARGB(255, 162, 161, 155),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/Mauro.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 300,
                  child: Column(
                    children: [
                      Text(
                        'Mauro Peniel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Software Engineer',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
