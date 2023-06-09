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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
          title: Text(
            'Emma - App',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: false,
        ),
        drawer: Drawer(
          backgroundColor: Colors.amber,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  'Título do Drawer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
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
        body: IndexedStack(
          index: _currentIndex,
          children: [
            Container(
              color: Color.fromARGB(255, 235, 235, 235),
              child: Center(
                child: Text('Página 1'),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Página 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Página 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Página 3',
            ),
          ],
        ),
      ),
    );
  }
}
