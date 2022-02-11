import 'package:flutter/material.dart';

class Details4 extends StatelessWidget {
  final String imageUrl;

  const Details4({Key key, this.imageUrl})  : super(key: key);
  @override


  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Details', style: TextStyle(color: Colors.white),
    ), 
    backgroundColor: Colors.pink[100],
    iconTheme: IconThemeData(color: Colors.white),
    brightness: Brightness.light,
    ),
    body: _buildBody(),
    );
  }
  Widget _buildBody(){
    return SingleChildScrollView(child: Column(children: <Widget>[_buildJournalHeaderImage(),
    SafeArea(
      child: Padding(padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_buildJournalEntry(),
      Divider(),
      _buildJournalWeather(),
      Divider(),
      _buildJournalTags(),
      Divider(),
      _buildJournalFooterImages(),
      ],),)
    )
    ],),);
  }
  Image _buildJournalHeaderImage(){
    return Image(image: AssetImage('images/Pasta1.jpg'),
    fit: BoxFit.cover,
    );
  }
  Column _buildJournalEntry(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Seafood Pasta',
      style: TextStyle(fontSize: 32.0,
      fontWeight: FontWeight.bold,
      ),),
      Divider(),
    Text('Ratings :', 
    style: TextStyle(color: Colors.black54),
    ),
    Row(
      children: [
        Icon(Icons.star, color: Colors.yellow[700],),
        Icon(Icons.star, color: Colors.yellow[700],),
        Icon(Icons.star, color: Colors.yellow[700]),
        Icon(Icons.star, color: Colors.yellow[700]),
        Icon(Icons.star, color: Colors.grey),
      ],
    ),
    ],
    );
  }
  Row _buildJournalWeather(){
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[Icon(Icons.bookmark,
    color: Colors.red,
    )],
    ),
    SizedBox(width: 16.0),
    Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(children: <Widget>[
        Text('Bookmarked', style: TextStyle(color: Colors.red),),
      ],),
      Row(children: <Widget>[
        Text('Price: \$7',
        style: TextStyle(fontSize: 17.0),
        ),
      ],)
    ],)
    ],
    );
  }
  Wrap _buildJournalTags(){
    return Wrap(
      spacing: 8.0,
      children: List.generate(3, (int index) {
        return Chip(label: Text('Food ${index + 1}'),
        avatar: Icon(Icons.fastfood_rounded,
        color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
        );
      }
      ),
    );
  }
  Row _buildJournalFooterImages(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[CircleAvatar(backgroundImage: AssetImage('images/Pasta2.jpg'),
      radius: 40.0,
      ),
      CircleAvatar(backgroundImage: AssetImage('images/Pasta3.jpg'),
       radius: 40.0,
      ),
      CircleAvatar(backgroundImage: AssetImage('images/Pasta4.jpg'),
       radius: 40.0,
      ),
      SizedBox(
        width:100.0,
      ),
      ],
    );
  }

}