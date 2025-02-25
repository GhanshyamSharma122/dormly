import 'package:flutter/material.dart';

class sellerdetails extends StatelessWidget {
  final Map<String, dynamic> item;

  const sellerdetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seller Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                item["image"],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              item["name"],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Price: ${item["price"]}",
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              item["description"] ?? "No description available",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Seller Info",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Assuming seller details are stored in the item
            Text("Seller Name: ${item["seller"] ?? "Unknown"}"),
            Text("Contact: ${item["contact"] ?? "Not available"}"),
          ],
        ),
      ),
    );
  }
}
