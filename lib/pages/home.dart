import 'package:dormly/pages/ui/grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {


  @override
  HomePageScreen createState() => HomePageScreen();
}

class HomePageScreen extends State<Home> {
  String selectedLocation = "BMSCE-IH";
  final List<String> location = [
    "BMSCE-IH",
    "BMSCE-NH2",
    "BMSCE-MH",
    "BMSCE-NH3",
    "BMSCE-Girls Hostel",
  ];

  final List<Map<String, dynamic>> filteredItems = [
    {"name": "Monitor", "price": "₹100", "image": "assets/item1.png"},
    {"name": "Laptop", "price": "₹200", "image": "assets/item2.png"},
    {"name": "Shoes", "price": "₹200", "image": "assets/item2.png"},
    {"name": "NoteBook", "price": "₹200", "image": "assets/item2.png"},
    {"name": "Pen", "price": "₹200", "image": "assets/item2.png"},
    {"name": "Guitar", "price": "₹200", "image": "assets/item2.png"},
    {"name": "Ukelele", "price": "₹200", "image": "assets/item2.png"},
    {"name": "Laptop stand", "price": "₹200", "image": "assets/item2.png"},
    {"name": "Cigarette", "price": "₹200", "image": "assets/item2.png"},
  ];

  final List<String> carouselImages = [
    'assets/pic.jpeg',
    'assets/pic.jpeg',
    'assets/pic.jpeg',
    'assets/pic.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 20),
            DropdownButton<String>(
              value:
                  location.contains(selectedLocation)
                      ? selectedLocation
                      : null, // Fix 1
              hint: Text("Select Location"), // To prevent null errors
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              items:
                  location.toSet().map((String location) {
                    // Fix 2 (Remove Duplicates)
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ), // Line between items
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.place, color: Colors.white),
                            SizedBox(width: 10),
                            Text(location, style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue ?? selectedLocation;
                });
              },
            ),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              autoSliderTransitionTime: Duration(microseconds: 800),
              autoSliderDelay: Duration(seconds: 3),
              slideBuilder: (index) {
                return Image.asset(carouselImages[index], fit: BoxFit.cover);
              },
              itemCount: carouselImages.length,
            ),
          ),

          Text("Hello"),

          Expanded(child: GridOfItems(filteredItems: filteredItems)),
        ],
      ),
    );
  }
}
