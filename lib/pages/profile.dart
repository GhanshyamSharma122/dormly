import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dormly/pages/login.dart';


 // Ensure this file exists with a LoginScreen widget

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icons.person,
              press: () {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.question_mark,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://wallpapers-clan.com/wp-content/uploads/2023/07/default-pfp-5.jpg",
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String text;
  final dynamic icon;
  final VoidCallback press;

  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.grey[200],
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}