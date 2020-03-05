import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  var prevText = "";
  var status = 0;
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
                child: Text('Scan result: $qrText'),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData == qrText) {
        print("QRTEXT:DUPLICATE");
      } else {
        print("QRTEXT:$scanData");
        setPersonData(scanData);
      }
      qrText = scanData;
      setState(() {});
    });
  }

  setPersonData(String id) async {
    print("Setting Data");
    var response = await http.post(
        'http://192.168.1.11:3000/registration/updatePerson',
        body: {'id': id, 'round': '0'});
    print("Response: ${response.body.runtimeType}");
    if (response.statusCode == 200) {
      setState(() {
        status = 1;
      });
    } else {
      status = 2;
    }
    Future.delayed(Duration(seconds: 1), () {
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
