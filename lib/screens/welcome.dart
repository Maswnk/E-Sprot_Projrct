import 'package:e_sport/screens/login.dart';
import 'package:e_sport/screens/register.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() => Center(
        child: Column(
          children: <Widget>[
            _logo(),
            _textWelcome(),
            _buttonlogin(),
            _buttonregis(),
          ],
        ),
      );

  Widget _logo() {
    return Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(children: [
          Image.asset(
            "assets/icon/logo.png",
            scale: 1.8,
          ),
          const Text(
            "E-Sport",
            style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 211, 25, 12),
                fontFamily: 'Mitr',
                fontStyle: FontStyle.italic),
          )
        ]));
  }

  Widget _textWelcome() {
    return Padding(
      padding: const EdgeInsets.only(top: 230),
      child: Column(
        children: const <Widget>[
          Text(
            "ยินดีต้อนรับ",
            style: TextStyle(
                fontSize: 23, fontFamily: 'Mitr', color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "แหล่งรวบรวมข่าวสารและ",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            "บริหารจัดการแข่งขันกีฬา E-SPORT",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            "ครบจบในที่เดียว",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buttonlogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Login();
            }));
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 17, 0),
          ),
          label: const Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Kanit',
              color: Color.fromARGB(255, 255, 17, 0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonregis() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Register();
            }));
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 17, 0),
          ),
          label: const Text(
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
