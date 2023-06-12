// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 235, 235, 235),
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.amber,
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
                  image: AssetImage('assets/homem.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
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
    );
  }
}
