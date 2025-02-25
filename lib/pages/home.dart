import 'package:dormly/pages/search.dart';
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

  final Map<String, List<Map<String, dynamic>>> categorizedItems = {
    "Electronics": [
      {"name": "Monitor", "price": "₹100", "image": "assets/pic.png"},
      {"name": "Laptop", "price": "₹200", "image": "assets/pic.png"},
      {"name": "Laptop stand", "price": "₹200", "image": "assets/pic.png"},
    ],
    "Clothes": [
      {"name": "Shoes", "price": "₹200", "image": "assets/pic.png"},
    ],
    "Instruments": [
      {"name": "Guitar", "price": "₹200", "image": "assets/pic.png"},
      {"name": "Ukelele", "price": "₹200", "image": "assets/pic.png"},
    ],
    "Stationeries": [
      {"name": "NoteBook", "price": "₹200", "image": "assets/pic.png"},
      {"name": "Pen", "price": "₹200", "image": "assets/pic.png"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 4),
                Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue!;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      items: location.map<DropdownMenuItem<String>>((String loc) {
                        return DropdownMenuItem<String>(
                          value: loc,
                          child: Text(loc),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(items: categorizedItems.values.expand((x) => x).toList()),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        "Search for items...",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 180, // Adjust height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CarouselSlider.builder(
                    enableAutoSlider: true, // Auto-swiping enabled
                    autoSliderDelay: Duration(seconds: 3), // Swipe every 3 sec
                    unlimitedMode: true, // Infinite looping
                    slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.only(bottom: 10),
                      indicatorBackgroundColor: Colors.grey,
                      currentIndicatorColor: Colors.blue,
                    ),
                    itemCount: 3, // Change as per your image count
                    slideBuilder: (index) {
                      List<String> images = [
                        "assets/pic.png",
                        "assets/pic.png",
                        "assets/pic.png",
                      ];
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover, // Full image fit
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categorizedItems.entries.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.key,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 212,
                          child: CarouselSlider.builder(
                            enableAutoSlider: false,
                            unlimitedMode: false,
                            itemCount: category.value.length,
                            slideBuilder: (index) {
                              final item = category.value[index];
                              return SizedBox(
                                height: 180,
                                child: GridOfItems(filteredItems: category.value),
                              );
                            },
                            slideIndicator: CircularSlideIndicator(
                              padding: EdgeInsets.only(bottom: 10),
                              indicatorBackgroundColor: Colors.grey,
                              currentIndicatorColor: Colors.blue,
                              indicatorRadius: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
