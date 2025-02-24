import 'package:flutter/material.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

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