import 'package:flutter/material.dart';
class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text("ram ram satya hai"),
      ),
    );
  }
}