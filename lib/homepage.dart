import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            title: Text("QR Scan"),
            icon: Icon(
              Icons.camera_alt,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Participants"),
            icon: Icon(
              Icons.list,
            ),
          ),
        ],
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
      ),
    );
  }
}
