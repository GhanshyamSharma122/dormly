import 'package:flutter/material.dart';
class GridOfItems extends StatelessWidget {
  const GridOfItems({
    super.key,
    required this.filteredItems,
  });

  final List<Map<String, dynamic>> filteredItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.8),itemCount: filteredItems.length, itemBuilder: (context,index){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                filteredItems[index]["image"]!,
                fit: BoxFit.cover,
                height: 130,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      filteredItems[index]["name"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    Text(filteredItems[index]["price"],
                    style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}
                  ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ), child: Text("Add to Cart",style: TextStyle(color: Colors.black),),),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}