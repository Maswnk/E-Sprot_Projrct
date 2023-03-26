// ignore_for_file: prefer_const_constructors

import 'package:e_sport/screens/competition.dart';
import 'package:e_sport/screens/firstpage.dart';
import 'package:e_sport/screens/news.dart';
import 'package:e_sport/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  final List<Widget> _pageWidget = <Widget>[
    const FirstPage(),
    const News(),
    const Competition(),
    const Profile(),
  ];

  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 35,
      ),
      label: "หน้าหลัก",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.newspaper_sharp,
        size: 35,
      ),
      label: 'ข่าวสาร',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_esports,
          size: 35,
        ),
        label: 'การแข่งขัน'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          size: 35,
        ),
        label: 'โปรไฟล์'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 1, 5, 36),
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
