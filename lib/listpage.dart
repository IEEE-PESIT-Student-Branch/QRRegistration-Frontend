import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Participants",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
        // future: http.get(''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return ListView();
          }
        },
      ),
    );
  }
}
