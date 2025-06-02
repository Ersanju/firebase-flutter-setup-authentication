import 'package:firebase_setup_console/data/cakes_data.dart';
import 'package:firebase_setup_console/data/celebrations_data.dart';
import 'package:firebase_setup_console/data/festival_data.dart';
import 'package:firebase_setup_console/data/flowers_data.dart';
import 'package:firebase_setup_console/data/gifts_data.dart';
import 'package:firebase_setup_console/data/kids_data.dart';
import 'package:firebase_setup_console/data/personalised_data.dart';
import 'package:firebase_setup_console/data/popular_product_data.dart';
import 'package:firebase_setup_console/data/two_hours.dart';
import 'package:firebase_setup_console/data/weddings_data.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> categories = [
    {"label": "Popular", "icon": Icons.star},
    {"label": "Cakes", "icon": Icons.cake},
    {"label": "Kids & Toys", "icon": Icons.toys},
    {"label": "Gifts", "icon": Icons.card_giftcard},
    {"label": "Flowers", "icon": Icons.person},
    {"label": "Personalised", "icon": Icons.home_mini_rounded},
    {"label": "Weddings", "icon": Icons.celebration},
    {"label": "Festivals", "icon": Icons.festival},
    {"label": "Celebration", "icon": Icons.celebration},
    {"label": "2-Hour delivery", "icon": Icons.delivery_dining},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Navigation
          Container(
            width: 100,
            color: const Color(0xFFF6F7F9),
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: isSelected ? Colors.white : const Color(0xFFF6F7F9),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Icon(categories[index]['icon'],
                            color: isSelected ? Colors.purple : Colors.black45),
                        const SizedBox(height: 4),
                        Text(
                          categories[index]['label'].split(' ')[0],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color:
                              isSelected ? Colors.purple : Colors.black87,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Right Grid Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (selectedIndex == 0) ...[
                    const Text("All Popular",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: popularProductsList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 1) ...[
                    const Text("Cakes",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: cakesList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 2) ...[
                    const Text("Kids",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: kidsList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 3) ...[
                    const Text("Gifts",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: giftsList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 4) ...[
                    const Text("Flowers",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: flowersList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 5) ...[
                    const Text("Personalised",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: personalisedList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 6) ...[
                    const Text("Weddings",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: weddingsList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 7) ...[
                    const Text("Festivals",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: festivalsList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 8) ...[
                    const Text("Celebrations",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: celebrationsList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                  if (selectedIndex == 9) ...[
                    const Text("2-Hour delivery",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: twoHoursList
                            .map((product) => Column(
                          children: [
                            Image.asset(product.imagePath,
                                width: 70, height: 70),
                            const SizedBox(height: 6),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}