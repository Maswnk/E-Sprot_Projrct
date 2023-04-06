import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
              Image.asset(
                "assets/icon/logo.png",
                scale: 7.2,
                alignment: Alignment.centerRight,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "E-SPORT",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 4, 4),
                    fontSize: 35,
                    fontFamily: 'Mitr',
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        //centerTitle: const EdgeInsets.all(10),
        backgroundColor: const Color.fromARGB(255, 1, 5, 36),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: "ค้นหา",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))),
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
