import 'package:e_sport/screens/competition.dart';
import 'package:e_sport/screens/firstpage.dart';
import 'package:e_sport/screens/forgetpass.dart';
import 'package:e_sport/screens/login.dart';
import 'package:e_sport/screens/news.dart';
import 'package:e_sport/screens/profile.dart';
import 'package:e_sport/screens/register.dart';
import 'package:e_sport/screens/welcome.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/login': (context) => Login(),
  '/welcome': (context) => Welcome(),
  '/register': (context) => Register(),
  '/forgetpass': (context) => ForgetPass(),
  '/firstpage': (context) => FirstPage(),
  '/news': (context) => News(),
  '/competition': (context) => Competition(),
  '/profile': (context) => Profile(),
};
