import 'package:flutter/material.dart';
import 'pages/addproduct.dart';
import 'pages/profile.dart';
import 'pages/home.dart';
import 'pages/favourites.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Deliveery',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
_MainScreenState createState()=>_MainScreenState();
}
class _MainScreenState extends State<MainScreen>{
  int _selectedIndex=0;
  final List<Widget> _screens=[
    Home(),
    Favourites(),
    ProfileScreen(),  
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label:"Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
        ]
      
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>
                AddProduct()
                )
       );
      },
      child: Icon(Icons.add),),
      );
  }
  
}
