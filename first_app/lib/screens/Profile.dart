import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container (
      color: Color.fromARGB(255, 235, 235, 235),
      child: Center(
        child: Text('Perfil'),
      ),
    );
  }
}