import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';
import 'user_data.dart';
import 'preference_helper.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[100],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: layout(),
        backgroundColor: Colors.white);
  }
  Widget layout() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50,bottom: 10),
            child: Image.asset(
              'images/Delish.png',
              height: 150,
            ),
          ),
        ),
        Center(
          child: Text(
            "Register",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.people, size: 18, color: Colors.pink[100],),
                hintText: 'Name',
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        new BorderSide(color: Colors.pink[50]))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail, size: 18, color: Colors.pink[100],),
                hintText: 'Email',
                enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(
                  color: Colors.pink[50],
                ))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 18, color: Colors.pink[100],),
                hintText: 'Password',
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        new BorderSide(color: Colors.pink[50]))),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Container(
          height: 50,
          width: 250,
          child: RaisedButton(
            onPressed: () async {
              if (emailController.text.trim().isEmpty ||
                  nameController.text.trim().isEmpty ||
                  passwordController.text.trim().isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please enter all the fields",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return;
              } else {
                await PreferenceHelper.saveUser(UserData(nameController.text,
                    emailController.text, passwordController.text));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (value) => false);
              }
            },
            child: Text(
              "REGISTER",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            color: Colors.pink[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: const Color(0xffe4dbea),
                )),
          ),
        ),
      ]),
    );
  }
}