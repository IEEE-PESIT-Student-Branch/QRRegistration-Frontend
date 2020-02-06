import 'package:flutter/material.dart';
import 'package:ieee_qr_app/homepage.dart';

void main() => runApp(QRApp());

class QRApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IEEE QR App',
      home: HomePage(),
    );
  }
}
