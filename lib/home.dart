import 'package:flutter/material.dart';
import 'package:cpmad_191373n/about.dart';
import 'package:cpmad_191373n/profile.dart';
import 'package:cpmad_191373n/drawer.dart';
import 'package:cpmad_191373n/menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Home';
  int index = 0;
  List<Widget> list = [Menu(), About(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[100],
          title: Text(title),
        ),
        // body: Home(),
        //  drawer:MyDrawer(),
        body: list[index],
        drawer: MyDrawer(
          onTap: (context, i, txt) {
            setState(() {
              index = i;
              title = txt;
              Navigator.pop(context);
            });
          },
        ));
  }
}
