import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: layout(), backgroundColor: Colors.white);
  }

  Widget layout() {
    return Column(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Image.asset(
            'images/Cafe.jpg',
            height: 200,
            width: 300,
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Image.asset(
            'images/Counter.jpg',
            height: 200,
            width: 270,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, top: 20),
        child: Text(
          "Welcome to Delish! We love to eat, travel, cook, and eat some more! We create & photograph various recipes from our home in Singapore. I created Delish to celebrate how nourishing, fun, and delicious cooking with seasonal meat and vegetables. I hope that will enjoy trying out various recipes here to inspire you to try cooking.",
          style: TextStyle(fontSize: 12),
        ),
      ),
    ]);
  }
}
