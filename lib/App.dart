import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/Routing/Router.dart';
import 'package:demo_template/UI/Pages/LoginViewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends GetView {
  final String defaultRoute;

  const MyApp({Key? key, required this.defaultRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: defaultRoute,
      onGenerateRoute: generateRoute,
      title: "Demo Template",
      debugShowCheckedModeBanner: false,
      // getPages: [
      //   GetPage(name: '/loginViewRoute', page:() => const LoginViewPage(),),
      // ],
      themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}