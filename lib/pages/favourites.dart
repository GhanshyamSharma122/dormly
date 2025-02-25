import 'package:flutter/material.dart';
import '/pages/ui/grid.dart';
class Favourites extends StatelessWidget {
   Favourites({super.key});
  final List<Map<String, dynamic>> ArrayName= [
  {"name": "Cheese Pizza", "image": "assets/cheese_pizza.png", "price": "\$8.99","category":"Pizza"},
  {"name": "Classic Burger", "image": "assets/classic_burger.png", "price": "\$6.49","category":"Burger"},
  {"name": "Fries", "image": "assets/fries.png", "price": "\$3.99","category":"Others"},
  {"name": "Ice Cream", "image": "assets/ice_cream.png", "price": "\$4.50","category":"Desserts"},
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child:GridOfItems(filteredItems: ArrayName),
      ),
    );
  }
}