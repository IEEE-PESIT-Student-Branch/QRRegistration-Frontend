import 'package:flutter/material.dart';
import 'package:ieee/qrpage.dart';

import 'listpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          QRPage(),
          ListPage(),
        ],
        onPageChanged: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text("Scan QR"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Participants"),
          ),
        ],
        onTap: (i) {
          _controller.animateToPage(i,
              duration: Duration(milliseconds: 100), curve: Curves.linear);
          setState(() {
            _selectedIndex = i;
          });
        },
      ),
    );
  }
}
