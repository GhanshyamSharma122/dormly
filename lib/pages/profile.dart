import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:dormly/pages/login.dart';
import 'package:dormly/pages/settings.dart';
import 'package:dormly/pages/help_center.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  // Load saved profile image path
  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (File(imagePath!).existsSync()) {
      setState(() {
        _profileImage = File(imagePath);
        _profileImagePath = imagePath;
      });
    }
  }

  // Pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        _profileImagePath = pickedFile.path;
      });
      _saveProfileImage(pickedFile.path);
    }
  }

  // Save image path in SharedPreferences
  Future<void> _saveProfileImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', imagePath);
  }

  // Show bottom sheet for camera/gallery selection
  void _showImagePickerDialog() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(20),
            height: 150,
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Take a Photo"),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Choose from Gallery"),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Profile",
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(image: _profileImage, onTap: _showImagePickerDialog),
            const SizedBox(height: 20),
            ProfileMenu(text: "My Account", icon: Icons.person, press: () {}),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help_outline,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpCenterPage(),
                  ),
                );
              },
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

// ✅ Profile Picture Widget
class ProfilePic extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const ProfilePic({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 120,
        width: 120,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipOval(
              child:
                  image != null
                      ? Image.file(image!, fit: BoxFit.cover)
                      : Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.account_circle,
                          size: 120,
                          color: Colors.grey,
                        ),
                      ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 15,
                child: const Icon(
                  Icons.camera_alt,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Profile Menu Widget
class ProfileMenu extends StatelessWidget {
  final String text;
  final IconData icon;
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
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onSurface,
              size: 22,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
