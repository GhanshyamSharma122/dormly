import 'package:flutter/material.dart';
import 'faq_page.dart';
import 'contact_support.dart';
import 'about_page.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About Dormly"),
            subtitle: const Text("Learn more about Dormly and its features."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );

            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("FAQs"),
            subtitle: const Text("Frequently asked questions and answers."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FAQPage()),
              );

            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Contact Support"),
            subtitle: const Text("Reach out to our support team."),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactSupportPage()),);
            },
          ),
        ],
      ),
    );
  }
}
