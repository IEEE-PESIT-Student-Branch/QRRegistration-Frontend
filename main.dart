import 'package:flutter/material.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
//import 'package:barcode_scan/barcode_scan.dart'

import 'home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

// class MainPage extends StatefulWidget {
//   @override
//   MainPageState createState() {
//     return new MainPageState();
//   }
// }

// class MainPageState extends State<MainPage> {
//   String result = 'hi';

//   Future _scanQR() async {
//     try {
//       String cameraScanResult = await scanner.scan();
//       print(cameraScanResult);
//       // setState(() {
//       //   result = cameraScanResult;
//       // });
//     } on PlatformException catch (ex) {
//       if (ex.code == scanner.CameraAccessDenied) {
//         setState(() {
//           result = "Camera permission was denied";
//         });
//       } else {
//         setState(() {
//           result = "Unknown Error $ex";
//         });
//       }
//     } on FormatException {
//       setState(() {
//         result = "You pressed the back button before scanning anything";
//       });
//     } catch (ex) {
//       setState(() {
//         result = "Unknown Error $ex";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image(
//           image: AssetImage('images/download.png'),
//           height: 25,
//           width: 500,
//         ),
//         backgroundColor: Colors.blueAccent,
//       ),
//        body: Stack(
//              children: <Widget>[
//                new Container(
//                  decoration: new BoxDecoration(
//                    image: new DecorationImage(
//                        image: new AssetImage('images/bg1.jpg'),
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                ),
//                Center(
//                    child:
//                    Column(
//                    children: <Widget>[
//                    FlatButton(
//                      onPressed: (){
//                        print(" ");
//                      },
//                      child:Text("EVENTS LIST",style: TextStyle(color: Colors.white),),
//                      color:Colors.lightBlueAccent,
//                    ),
//                    FlatButton(
//                      onPressed: (){
//                        print(" ");
//                      },
//                      child:Text("PARTICIPANTS LIST",style: TextStyle(color: Colors.white),),
//                      color:Colors.lightBlueAccent,
//                    ),
//                  ],

//                )
//                )

//              ],

//          ),


//        //Container(
// ////          decoration: new BoxDecoration(
// ////        image: new DecorationImage(
// ////          image: new AssetImage('images/.jpg'),
// ////          fit:BoxFit.cover,
// //        ),
//       //)
//       floatingActionButton: FloatingActionButton.extended(
//         icon: Icon(Icons.camera_alt),
//         label: Text("Scan"),
//         onPressed: _scanQR,
//         backgroundColor: Colors.blueAccent,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
