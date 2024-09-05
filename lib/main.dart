import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingCartScreen extends StatelessWidget {
  final List<Item> items = [
    Item(name: "Pullover", color: "Black", size: "L", price: 51, imageUrl: "assets/pullover.png"),
    Item(name: "T-Shirt", color: "Gray", size: "L", price: 30, imageUrl: "assets/tshirt.png"),
    Item(name: "Sport Dress", color: "Black", size: "M", price: 43, imageUrl: "assets/flutter_shirt.png"),
  ];

  @override
  Widget build(BuildContext context) {
    int totalAmount = items.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Bag"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(item: items[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total amount:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$$totalAmount",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Updated to backgroundColor
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "CHECK OUT",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final Item item;

  CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              item.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Color: ${item.color}, Size: ${item.size}"),
                ],
              ),
            ),
            Column(
              children: [
                Text("\$${item.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    Text("1"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String color;
  final String size;
  final int price;
  final String imageUrl;

  Item({required this.name, required this.color, required this.size, required this.price, required this.imageUrl});
}
