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

  final List<String> carouselImages = [
    'assets/pic.png',
    'assets/pic.png',
    'assets/pic.png',
    'assets/pic.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                value:
                    location.contains(selectedLocation)
                        ? selectedLocation
                        : null,
                hint: Text("Select Location"),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(10),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                items:
                    location.map((String location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location, style: TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue ?? selectedLocation;
                  });
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: CarouselSlider.builder(
                unlimitedMode: true,
                autoSliderTransitionTime: Duration(milliseconds: 800),
                autoSliderDelay: Duration(seconds: 3),
                slideBuilder: (index) {
                  return Image.asset(carouselImages[index], fit: BoxFit.cover);
                },
                itemCount: carouselImages.length,
              ),
            ),

            // Displaying categorized sliders
            for (var category in categorizedItems.keys) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  category,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    var item = categorizedItems[category]![index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item['image'], height: 60),
                          SizedBox(height: 5),
                          Text(item['name'], style: TextStyle(fontSize: 16)),
                          Text(
                            item['price'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: categorizedItems[category]!.length,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
