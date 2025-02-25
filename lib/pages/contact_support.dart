import 'package:flutter/material.dart';

class ContactSupportPage extends StatefulWidget {
  @override
  _ContactSupportPageState createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String selectedIssue = 'General Inquiry'; // Default issue type

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate form submission (replace with API call)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Your message has been sent!"),
          backgroundColor: Colors.green,
        ),
      );

      // Clear fields after submission
      nameController.clear();
      emailController.clear();
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Support"),
        backgroundColor: Color(0xFFFF9800),

    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We'd love to help!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Name Field
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Your Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter your name" : null,
              ),
              SizedBox(height: 15),

              // Email Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Your Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty || !value.contains("@")
                    ? "Enter a valid email"
                    : null,
              ),
              SizedBox(height: 15),

              // Issue Type Dropdown
              DropdownButtonFormField<String>(
                value: selectedIssue,
                decoration: InputDecoration(
                  labelText: "Issue Type",
                  prefixIcon: Icon(Icons.report_problem),
                  border: OutlineInputBorder(),
                ),
                items: [
                  'General Inquiry',
                  'Account Issue',
                  'Product Issue',
                  'Bug Report'
                ].map((String issue) {
                  return DropdownMenuItem<String>(
                    value: issue,
                    child: Text(issue),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedIssue = value!;
                  });
                },
              ),
              SizedBox(height: 15),

              // Message Field
              TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Your Message",
                  prefixIcon: Icon(Icons.message),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter your message" : null,
              ),
              SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: submitForm,
                  icon: Icon(Icons.send),
                  label: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
