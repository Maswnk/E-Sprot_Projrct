// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:e_sport/models/profile.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', firstname: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "สมัครสมาชิก",
          style:
              TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'Mitr'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _boxname(),
              _boxsurname(),
              _boxemail(),
              _boxepass(),
              _boxeconfirmpass(),
              _boxage(),
              _buttonconfirm(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boxname() {
    final TextField _txtName = TextField(
      decoration: InputDecoration(
        hintText: "ชื่อ",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "ชื่อ",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Kanit',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(const Radius.circular(5)),
            ),
            child: _txtName,
          ),
        ],
      ),
    );
  }

  Widget _boxsurname() {
    final TextField _txtsurName = TextField(
      decoration: InputDecoration(
        hintText: "นามสกุล",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "นามสกุล",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Kanit',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(const Radius.circular(5)),
            ),
            child: _txtsurName,
          ),
        ],
      ),
    );
  }

  Widget _boxemail() {
    final TextField _txtEmail = TextField(
      decoration: InputDecoration(
        hintText: "อีเมล",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onChanged: (String email) {
        profile.email = email;
      },
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "อีเมล",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Kanit',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(const Radius.circular(5)),
            ),
            child: _txtEmail,
          ),
        ],
      ),
    );
  }

  Widget _boxepass() {
    final TextField _txtPass = TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "รหัสผ่าน",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
      onChanged: (String password) {
        profile.password = password;
      },
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "รหัสผ่าน",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Kanit',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: _txtPass,
          ),
        ],
      ),
    );
  }

  Widget _boxeconfirmpass() {
    final TextField _txtconfirmPass = TextField(
      decoration: InputDecoration(
        hintText: "ยืนยันรหัสผ่าน",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "ยืนยันรหัสผ่าน",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Kanit',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(const Radius.circular(5)),
            ),
            child: _txtconfirmPass,
          ),
        ],
      ),
    );
  }

  Widget _boxage() {
    final TextField _txtAge = TextField(
      decoration: InputDecoration(
        hintText: "อายุ",
        contentPadding: EdgeInsets.all(19),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    final TextField _txtGender = TextField(
      decoration: InputDecoration(
        hintText: "เพศ",
        contentPadding: EdgeInsets.all(19),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Text(
                "อายุ",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(width: 165),
              Text(
                "เพศ",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit',
                ),
              ),
            ],
          ),
          SizedBox(width: 160),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 170,
                height: 55,
                child: _txtAge,
              ),
              SizedBox(width: 26),
              Container(
                width: 170,
                height: 55,
                child: _txtGender,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonconfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              primary: Color.fromARGB(255, 255, 17, 0)),
          onPressed: () {
            formKey.currentState?.save();
            print("email = ${profile.email}");
          },
          icon: Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: Text(
            "ลงทะเบียน",
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
}
