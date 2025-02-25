import 'package:flutter/material.dart';

import '../sellerdetails.dart';

class GridOfItems extends StatefulWidget {
  const GridOfItems({
    super.key,
    required this.filteredItems,
  });

  final List<Map<String, dynamic>> filteredItems;

  @override
  _GridOfItemsState createState() => _GridOfItemsState();
}

class _GridOfItemsState extends State<GridOfItems> {
  // List<Map<String, dynamic>> favoriteItems = []; // Store favorite items

  // void addToFavorites(Map<String, dynamic> item, BuildContext context) {
  //   setState(() {
  //     favoriteItems.add(item);
  //   });
  //
  //   // Navigate to Favourites page with selected items
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Favourites(favoriteItems: favoriteItems),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // Fixed height to avoid vertical scrolling
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // Disable scrolling
        shrinkWrap: true, // Ensure proper height calculation
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: widget.filteredItems.length,
        itemBuilder: (context, index) {
          final item = widget.filteredItems[index];

          return Stack(
            children: [
              // Card wrapped with GestureDetector for navigation
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sellerdetails(item: item),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item["image"],
                          fit: BoxFit.cover,
                          height: 110,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["description"] ?? "No description",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${item["price"]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Positioned CircularAvatar for "Add to Favorites"
              Positioned(
                bottom: 95, // Adjust position relative to image height
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        // addToFavorites(item, context); // Pass item to favorites
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
