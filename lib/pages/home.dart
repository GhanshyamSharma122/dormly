import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageScreen createState() => HomePageScreen();
}

class HomePageScreen extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
        itemCount: 10,
        itemBuilder: (context,index){
            return Container(
              color: Colors.blueAccent,
              child: Center(child: Text("$index",style: TextStyle(color: Colors.white),)),
            );
        },
      )
    );
  }
}