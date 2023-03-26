// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'firstpage.dart';

class Competition extends StatefulWidget {
  const Competition({super.key});

  @override
  State<Competition> createState() => _CompetitionState();
}

class _CompetitionState extends State<Competition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.sports_esports,
                    size: 35,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                "การแข่งขันทั้งหมด",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontFamily: 'Mitr',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
        //centerTitle: const EdgeInsets.all(10),
        backgroundColor: Color.fromARGB(255, 1, 5, 36),
        elevation: 0,
      ),
      body: Center(
        child: Text("Competition"),
      ),
    );
  }
}
