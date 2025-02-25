import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Dormly"),
        backgroundColor: Color(0xFFFF9800),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/dormly_logo.png', // Change path if needed
                  height: 120,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // App Description
            const Text(
              "Dormly is a second-hand marketplace for hostel students, making it easy to buy and sell used items within your college community. Whether it's books, electronics, or furniture, Dormly connects students for a hassle-free trading experience.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

            // Features
            const Divider(),
            const SizedBox(height: 10),
            featureItem(Icons.shopping_cart, "Buy & Sell Easily"),
            featureItem(Icons.school, "Perfect for Hostel Students"),
            featureItem(Icons.chat, "24/7 customer support"),
            featureItem(Icons.verified, "Safe & Verified Listings"),
            const SizedBox(height: 20),

            // Contact Us
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "Need help? Contact us at:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            const Text(
              "help.dormly@gmail.com",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  // Feature Item Widget
  Widget featureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
