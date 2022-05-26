import 'dart:io';

import 'package:demo_template/App.dart';
import 'package:demo_template/DataHandler/Local/SharedPrefs.dart';
import 'package:demo_template/Models/APIs/APIService.dart';
import 'package:demo_template/Routing/RouteNames.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  // await SharedPrefs.initSharedPrefs();
  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   await Firebase.initializeApp();
  //   if (kDebugMode) {
  //     print('--- main: Firebase.initializeApp ---');
  //   }
  // } else {
  //   Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //       apiKey: "AIzaSyCDag1eXU0QRDMhmh_xHruzJAygvY4mnkE",
  //       authDomain: "getx-demo-58e1c.firebaseapp.com",
  //       databaseURL: "https://getx-demo-58e1c-default-rtdb.asia-southeast1.firebasedatabase.app",
  //       projectId: "getx-demo-58e1c",
  //       storageBucket: "getx-demo-58e1c.appspot.com",
  //       messagingSenderId: "26016724142",
  //       appId: "1:26016724142:web:058160bdcedb91fde8e93f",
  //       measurementId: "G-16YVTX78MQ"
  //       ),
  //       );
  //
    await Firebase.initializeApp();
    await APIService.init();

    runApp(
      const MyApp(
        defaultRoute: loginViewRoute,
      ),
    );
  }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
