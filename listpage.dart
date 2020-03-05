import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    getParticipantsList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  QuerySnapshot querySnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Participants",
          textAlign: TextAlign.center,),
      ),
      body: _showParticipants(),


    );
  }

  Widget _showParticipants() {
    if (querySnapshot != null) {
      return ListView.builder(
          primary: false,
          itemCount: querySnapshot.documents.length,
          padding: EdgeInsets.all(12),
          itemBuilder: (context, i) {
            return Column(
                children: <Widget>[
                  Text("${querySnapshot.documents[i].data['name']}",
                  style:TextStyle(fontWeight: FontWeight.bold)),
                ]
            );
          }
      );
    }

    }
  }
getParticipantsList() async {
  return await Firestore.instance.collection('participant').getDocuments();
}