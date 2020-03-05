import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  var status = 0;
  var isNew = false;
  QRViewController controller;

  Color getContainerColor() {
    if (status == 0) {
      return Colors.white;
    } else if (status == 1) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Future addData(String qrText) async {
       if(qrText==''){
          print('null');
          setState(() {
            status=0;
          });
        }
        else{
          _firestore.collection('participant')
                    .document(qrText)
                    .get()
                    .then((DocumentSnapshot ds){
                      setState(() {
                        isNew = ds.exists;
                      });
                       
                    });
           
            if(isNew==false){
                _firestore.collection('participant')
                .document(qrText)
                .setData({
                'name': qrText
              });
              setState(() {
                status=1;
              });
            }
            else{
              setState(() {
                status=2;
              });
            }
        }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: getContainerColor(),
                child: Center(

                  child: FlatButton(
                    onPressed: () { 
                        addData(qrText);
                    },
                    child: Text(
                        'Send',
                        style:TextStyle(color: Colors.blue)
                    ),

                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;    
    controller.scannedDataStream.listen((scanData) {
        setState(() {
          qrText = scanData;
        });

    });
     Future.delayed(Duration(seconds: 10), () {
        setState(() {
          status = 0;
        });
      });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
