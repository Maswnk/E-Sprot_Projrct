// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:e_sport/screens/firstpage.dart';
import 'package:e_sport/screens/forgetpass.dart';
import 'package:e_sport/screens/launcher.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: 'Mitr'),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _welcome(),
                _boxmail(),
                _buttonlogin(),
                _text(),
                _buttonloginfacebook(),
                _buttonlogingoogle(),
              ],
            ),
          ],
        ));
  }

  Widget _welcome() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "ยินดีต้อนรับ",
            style: TextStyle(
                fontSize: 25, fontFamily: 'Mitr', color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "กรุณากรอกอีเมลและรหัสผ่านเพื่อเข้าสู่ระบบ",
            style: TextStyle(
                fontSize: 19, color: Colors.black87, fontFamily: 'Kanit'),
          ),
        ],
      ),
    );
  }

  Widget _boxmail() {
    final TextField _txtMail = TextField(
      decoration: InputDecoration(
        hintText: "อีเมล",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
    );

    final TextField _txtpass = TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "รหัสผ่าน",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(const Radius.circular(5)),
            ),
            child: _txtMail,
          ),
          Container(
            margin: EdgeInsets.only(top: 19),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(const Radius.circular(5)),
            ),
            child: _txtpass,
          ),
          Container(
            margin: EdgeInsets.only(top: 0, left: 250),
            child: TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ForgetPass();
                }));
              },
              child: Text(
                "ลืมรหัสผ่าน ?",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonlogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 17, 0)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Launcher();
            }));
          },
          icon: Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Kanit',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: Text(
        "- - - -  หรือเชื่อมต่อกับบัญชีอื่นของคุณ - - - - ",
        style:
            TextStyle(fontSize: 19, fontFamily: 'Kanit', color: Colors.black87),
      ),
    );
  }

  Widget _buttonloginfacebook() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 27, 83, 251)),
          onPressed: () {},
          icon: Icon(
            Icons.facebook,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: Text(
            "เชื่อมต่อกับ Facebook",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Kanit',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonlogingoogle() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {},
          icon: Image.asset(
            'assets/ggo.png',
            height: 22,
            width: 22,
          ),
          label: Text(
            "เชื่อมต่อกับ Google",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Kanit',
              color: Color.fromARGB(255, 10, 10, 10),
            ),
          ),
        ),
      ),
    );
  }
}
