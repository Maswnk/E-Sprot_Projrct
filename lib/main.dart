import 'package:e_sport/routes.dart';
import 'package:e_sport/screens/welcome.dart';
import 'package:e_sport/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Sport",
      initialRoute: '/welcome',
      routes: routes,
    );
  }
}
