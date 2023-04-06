import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_sport/models/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'forgetpass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text(
                "เข้าสู่ระบบ",
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: 'Mitr'),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 249, 249, 249),
              elevation: 0,
            ),
            body: SizedBox(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _welcome(),
                          _boxemail(),
                          _boxepass(),
                          _buttonconfirm(),
                          _text(),
                          _buttonloginfacebook(),
                          _buttonlogingoogle(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    //
  }

  Widget _welcome() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
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

  Widget _boxemail() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "อีเมล",
              contentPadding: EdgeInsets.all(19),
              border: OutlineInputBorder(),
            ),
            validator: MultiValidator([
              RequiredValidator(errorText: "กรุณากรอกอีเมล"),
              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
            ]),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            onSaved: (String? email) {
              profile.email = email;
            },
          ),
        ],
      ),
    );
  }

  Widget _boxepass() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "รหัสผ่าน",
              contentPadding: EdgeInsets.all(19),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String? password) {
              profile.password = password;
            },
            validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 250),
            child: TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ForgetPass();
                }));
              },
              child: const Text(
                "ลืมรหัสผ่าน ?",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonconfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: profile.email!,
                  password: profile.password!,
                )
                    .then((value) {
                  formKey.currentState!.reset();
                  Fluttertoast.showToast(
                      msg: "เข้าสู่ระบบสำเร็จ", gravity: ToastGravity.SNACKBAR);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/luancher',
                    (route) => false,
                  );
                });
              } on FirebaseAuthException catch (e) {
                Fluttertoast.showToast(
                  msg: 'อีเมล หรือ รหัสผ่านไม่ถูกต้อง',
                  gravity: ToastGravity.SNACKBAR,
                );
              }
            }
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: const Text(
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
    return const Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
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
              backgroundColor: const Color.fromARGB(255, 27, 83, 251)),
          onPressed: () {},
          icon: const Icon(
            Icons.facebook,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: const Text(
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
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {},
          icon: Image.asset(
            'assets/ggo.png',
            height: 22,
            width: 22,
          ),
          label: const Text(
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
