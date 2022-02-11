import 'package:flutter/material.dart';
import 'login.dart';
import 'user_data.dart';
import 'preference_helper.dart';

class MyDrawer extends StatefulWidget {
  final Function onTap;

  MyDrawer({this.onTap});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserData userData;

  @override
  Widget build(BuildContext context) {
    getUserData();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
               decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/Sky.jpg'),
                fit: BoxFit.cover
                ),
              ),
               child: Padding(
               padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Me.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      userData?.name ?? "",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.pink[100],),
              title: Text('Menu'),
              onTap: () => widget.onTap(context, 0, 'Menu'),
            ),
             ListTile(
              leading: Icon(Icons.question_answer, color: Colors.pink[100],),
              title: Text('About'),
              onTap: () => widget.onTap(context, 1, 'About'),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.pink[100],),
              title: Text('Profile'),
              onTap: () => widget.onTap(context, 2, 'Profile'),
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.pink[100]),
                title: Text('Logout'),
                onTap: () async {
                  await PreferenceHelper.clearStorage();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }),
          ],
        ),
      ),
    );
  }

  getUserData() async {
    userData = await PreferenceHelper.getUserData();
    setState(() {});
  }
}
