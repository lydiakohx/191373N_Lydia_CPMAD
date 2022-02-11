import 'package:cpmad_191373n/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cpmad_191373n/CartController.dart';
import 'package:cpmad_191373n/CartPage.dart';

class Menu extends StatefulWidget{
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _shoeName = [
    'Four Cheese Pizza',
    'Blueberry Pancakes',
    'Seafood Pasta',
    'Sirloin Steak',
    'Fried Cutlet Burger',
    'Avocado Toast'
  ];

  final _shoePrice = [
    '\$15.0',
    '\$9.0',
    '\$13.0',
    '\$44.0',
    '\$10.0',
    '\$7.0'
  ];

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: InkWell(
                splashColor: Colors.redAccent,
                highlightColor: Colors.blueAccent.withOpacity(0.5),
                onTap: (){
                  // Navigator.push(
                  //context,
                  //MaterialPageRoute(
                  //builder: (context) => CartPage(),
                  //),
                //);
                Get.to(() => CartPage());
                },
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    Positioned(
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                          size: 20.0, color: Colors.red[700]),
                          Positioned(
                            top: 3.0,
                            right: 7,
                            child: Center(
                              child: Obx(
                                () => Text(
                                  cartController.count.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                                ),
                              ),
                            )),
                        ],
                      )),
                  ],
                ),
              )),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6,(index){
          return InkWell(
            splashColor: Colors.blueAccent,
            highlightColor: Colors.blueAccent.withOpacity(1.0),
            onTap: (){
              cartController.addToCart(index);
            },
            child: _buildGridCards(index, 'images/shoe_${index + 1}.jpg', _shoeName[index], _shoePrice[index]),
          );
        }),
      ),
    );
  }

  Widget _buildGridCards(int index, String imgPath, String shoeName, String shoePrice){
    return Card(
      color: Colors.lightBlueAccent[50],
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 90,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Text(shoeName, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Text(shoePrice, style: TextStyle(fontSize: 14.0),
        ),
        FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Details()
                      ));
                    },
                    mini: true,
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    child: Center(
                        child: Icon(Icons.arrow_forward, color: Colors.black)),
                  ),
      ],
    ),
    );
  }
}