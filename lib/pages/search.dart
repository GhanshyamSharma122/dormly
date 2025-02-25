import 'package:dormly/pages/ui/grid.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const SearchPage({Key? key, required this.items}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = []; // Initially, no items are shown
  }

  void _filterSearchResults(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
          item["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true, // Automatically focus on search bar
          decoration: InputDecoration(
            hintText: "Search items...",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search, color: Colors.blue),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue, width: 2), // Highlight border
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          ),
          onChanged: _filterSearchResults,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _filteredItems.isEmpty
        ? Center(child: Text("No items found!"))
            : Padding(
        padding: EdgeInsets.all(10),
        child: GridOfItems(filteredItems: _filteredItems),
        ),
    );
  }
}
