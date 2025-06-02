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

  List<dynamic> getSelectedList() {
    switch (selectedIndex) {
      case 0:
        return popularProductsList;
      case 1:
        return cakesList;
      case 2:
        return kidsList;
      case 3:
        return giftsList;
      case 4:
        return flowersList;
      case 5:
        return personalisedList;
      case 6:
        return weddingsList;
      case 7:
        return festivalsList;
      case 8:
        return celebrationsList;
      case 9:
        return twoHoursList;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'All Categories',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Row(
          children: [
            // Left Navigation
            Container(
              width: 90,
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
                                color: isSelected ? Colors.purple : Colors.black87,
                                fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.normal),
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
                    Text(
                      categories[selectedIndex]["label"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 400  ,
                      height: 2,
                      color: Colors.purple, // You can match your brand color
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.85,
                        physics: const BouncingScrollPhysics(),
                        children: getSelectedList()
                            .map(
                              (product) => Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  product.imagePath,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    product.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
