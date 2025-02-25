import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
      ),
      body: const FAQList(),
    );
  }
}

class FAQList extends StatelessWidget {
  const FAQList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        "question": "What is Dormly?",
        "answer": "Dormly is a second-hand marketplace for hostel students to buy and sell items safely."
      },
      {
        "question": "Who can use Dormly?",
        "answer": "Only hostel students can use Dormly. You must verify your account using your college email."
      },
      {
        "question": "Is Dormly free to use?",
        "answer": "Yes, Dormly is completely free for both buyers and sellers."
      },
      {
        "question": "How do I list an item for sale?",
        "answer": "Go to the Sell section, upload pictures, add a description, and set your price."
      },
      {
        "question": "How do I contact a seller?",
        "answer": "Each product page has a chat option where you can message the seller directly."
      },
      {
        "question": "How do payments work?",
        "answer": "Payments are handled directly between buyers and sellers. You can pay via cash or UPI."
      },
      {
        "question": "How do I report a scam or issue?",
        "answer": "You can report a user by clicking on the 'Report' button on their profile or in the Help Center."
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).colorScheme.surface,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: Text(
              faqs[index]["question"]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            iconColor: Theme.of(context).colorScheme.onSurface,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  faqs[index]["answer"]!,
                  style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
