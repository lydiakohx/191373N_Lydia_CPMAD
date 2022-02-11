import 'package:flutter/material.dart';
import 'about.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: layout(), backgroundColor: Colors.white);
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
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            child: Text(
              "Update",
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