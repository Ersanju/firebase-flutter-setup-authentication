import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  final List<Map<String, dynamic>> orders = const [
    {
      "image": "assets/kids/teddy_bear.png", // Replace with actual image
      "status": "Arriving tomorrow by 11 pm",
      "statusColor": Colors.green,
      "product": "TEDDY BEAR toy",
    },
    {
      "image": "assets/cakes/Butterscotch-Cake.png",
      "status": "Refund Completed",
      "statusColor": Colors.black54,
      "product": "Butterscotch-Cake",
    },
    {
      "image": "assets/cakes/Kids-Cake.png",
      "status": "Refund Completed",
      "statusColor": Colors.black54,
      "product": "Kids Cake",
    },
    {
      "image": "assets/kids/doll_house.png",
      "status": "Delivered on May 07",
      "statusColor": Colors.black87,
      "product": "Doll House",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
      ),
      body: ListView.separated(
        itemCount: orders.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            leading: Image.asset(order["image"], fit: BoxFit.cover),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order["status"],
                  style: TextStyle(
                    color: order["statusColor"],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  order["product"],
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    5,
                        (star) => const Icon(Icons.star_border, size: 23, color: Colors.grey),
                  ),
                ),
                const Text(
                  "Rate this product now",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to rating/review or order details
            },
          );
        },
      ),
    );
  }
}
