import 'package:firebase_setup_console/widgets/all_gifts_page/product_page.dart';
import 'package:flutter/material.dart';

class AllGiftsPage extends StatefulWidget {
  @override
  _AllGiftsPageState createState() => _AllGiftsPageState();
}

class _AllGiftsPageState extends State<AllGiftsPage> {
  int _selectedIndex = 2;

  List<Map<String, dynamic>> giftTypes = [
    {
      'title': 'Cakes',
      'image': 'https://via.placeholder.com/60', // Replace with actual image URL
      'subcategories': [
        'Celebrate Special Occasions',
        'Top Picks',
        'Yummy Treats',
        'Flavour Choices',
        'Send Cakes to',
      ]
    },
    {
      'title': 'Flowers',
      'image': 'https://via.placeholder.com/60',
    },
    {
      'title': 'Personalised',
      'image': 'https://via.placeholder.com/60',
    },
    {
      'title': 'Plants',
      'image': 'https://via.placeholder.com/60',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Gifts'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: giftTypes.length,
        itemBuilder: (context, index) {
          final gift = giftTypes[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ExpansionTile(
              leading: Image.network(gift['image'], width: 50, height: 50),
              title: Text(gift['title']),
              children: gift['subcategories'] != null
                  ? (gift['subcategories'] as List<String>)
                  .map((sub) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(sub),
                  ),
                ),
              ))
                  .toList()
                  : [],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping), label: 'Same Day'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'All Gifts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight_takeoff), label: 'Abroad'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}