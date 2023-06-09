import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_sport/models/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  Profile profile = Profile();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("User Table");

  final _passwordController = TextEditingController();
  final _date = TextEditingController();
  bool isChecked = false;

  // void dispise() {
  //   _passwordController.dispose();
  //   super.dispose();
  // }

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
                "สมัครสมาชิก",
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
                          _boxname(),
                          _boxsurname(),
                          _boxemail(),
                          _boxepass(),
                          _boxeconfirmpass(),
                          _boxbirthday(),
                          _buttonaccept(),
                          _buttonconfirm(),
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

  Widget _boxname() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "ชื่อ",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit',
              ),
            ),
            const SizedBox(height: 2),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "ชื่อ",
                contentPadding: EdgeInsets.all(19),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String? firstname) {
                profile.firstname = firstname;
              },
              validator: RequiredValidator(errorText: "กรุณากรอกชื่อ"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxsurname() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "นามสกุล",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit',
              ),
            ),
            const SizedBox(height: 2),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "นามสกุล",
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String? lastname) {
                profile.lastname = lastname;
              },
              validator: RequiredValidator(errorText: "กรุณากรอกนามสกุล"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxemail() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "อีเมล",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit',
              ),
            ),
            const SizedBox(height: 2),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "อีเมล",
                contentPadding: EdgeInsets.all(20),
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
      ),
    );
  }

  Widget _boxepass() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "รหัสผ่าน",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "รหัสผ่าน",
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String? password) {
                profile.password = password;
              },
              validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxeconfirmpass() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "ยืนยันรหัสผ่าน",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "ยืนยันรหัสผ่าน",
                contentPadding: EdgeInsets.all(19),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณายืนรหัสผ่าน';
                } else if (value != _passwordController.text) {
                  return 'รหัสผ่านไม่ตรงกัน';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxbirthday() {
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "วันเกิด",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit',
                ),
              ),
              const SizedBox(width: 160),
              TextFormField(
                controller: _date,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                  hintText: "วันเกิด",
                  contentPadding: EdgeInsets.all(19),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));

                  if (pickeddate != null) {
                    final DateFormat formatter = DateFormat('dd/MM/yyyy');
                    final String formatted = formatter.format(pickeddate);
                    setState(
                      () {
                        _date.text = formatted;
                      },
                    );
                  }
                },
                onSaved: (String? date) {
                  profile.birthday = date;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณายืนเลือกวันเกิด';
                  }
                  return null;
                },
              ),
            ],
          ),
        ));
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
              backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
          onPressed: () async {
            if (isChecked) {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                userCollection.add({
                  "firstname": profile.firstname,
                  "lastname": profile.lastname,
                  "email": profile.email,
                  "password": profile.password,
                  "birthday": profile.birthday,
                });
                try {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: profile.email!,
                    password: profile.password!,
                  )
                      .then((value) {
                    formKey.currentState!.reset();
                    Fluttertoast.showToast(
                        msg: "สมัครสมาชิกสำเร็จ",
                        gravity: ToastGravity.SNACKBAR);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/welcome',
                      (route) => false,
                    );
                  });
                } on FirebaseAuthException catch (e) {
                  String? messageemailerror;
                  if (e.code == 'email-already-in-use') {
                    messageemailerror =
                        "มีอีเมลนี้ในระบบแล้ว โปรดใช้อีเมลอื่นแทน";
                  } else if (e.code == 'weak-password') {
                    messageemailerror =
                        "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                  } else {
                    messageemailerror = e.message;
                  }
                  Fluttertoast.showToast(
                    msg: '$messageemailerror',
                    gravity: ToastGravity.SNACKBAR,
                  );
                }
              }
            } else {
              Fluttertoast.showToast(
                msg: 'กรุณากดยอมรับเงื่อนไข',
                gravity: ToastGravity.SNACKBAR,
              );
            }
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 255, 255),
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

  Widget _buttonaccept() {
    //TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 8, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 21,
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      if (newValue != null) {
                        setState(() {
                          isChecked = newValue;
                        });
                      }
                    },
                  ),
                  const Text(
                    'ยอมรับเงื่อนไขการใช้บริการ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // โค้ดสำหรับแสดงหน้าข้อกำหนดการให้บริการ
                  },
                  child: const Text(
                    'ข้อกำหนดในการให้บริการ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Kanit',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Text(
                  'และ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Kanit',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // โค้ดสำหรับแสดงหน้าข้อกำหนดการให้บริการ
                  },
                  child: const Text(
                    'นโยบายความเป็นส่วนตัว*',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Kanit',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            if (!isChecked)
              const Padding(
                padding: EdgeInsets.only(top: 1, left: 8),
                child: Text(
                  'กรุณากดยอมรับ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
