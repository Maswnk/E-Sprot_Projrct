// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'firstpage.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
            children: <Widget>[
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.newspaper_sharp,
                    size: 35,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                "ข่าวสารทั้งหมด",
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
        child: Text("News"),
      ),
    );
  }
}
