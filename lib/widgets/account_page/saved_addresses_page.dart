import 'package:flutter/material.dart';

import 'add_address_page.dart';

class SavedAddressesPage extends StatefulWidget {
  const SavedAddressesPage({super.key});

  @override
  State<SavedAddressesPage> createState() => _SavedAddressesPageState();
}

class _SavedAddressesPageState extends State<SavedAddressesPage> {
  List<Map<String, String>> savedAddresses = [];

  void addAddress(Map<String, String> newAddress) {
    setState(() {
      savedAddresses.add(newAddress);
    });
    Navigator.pop(context);
  }

  void openAddAddressForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAddressPage(onSave: addAddress),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Addresses")),
      body: Column(
        children: [
          GestureDetector(
            onTap: openAddAddressForm,
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              color: Colors.green[100],
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8),
                  Text("Add Address"),
                ],
              ),
            ),
          ),
          if (savedAddresses.isEmpty)
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 60, color: Colors.red),
                    SizedBox(height: 10),
                    Text("No saved addresses yet"),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: savedAddresses.length,
                itemBuilder: (context, index) {
                  final address = savedAddresses[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text("Mr. ${address['name']}"),
                      subtitle: Text(
                          "${address['house']}, ${address['street']}, ${address['landmark']}, ${address['pincode']}\nMobile: ${address['mobile']}"),
                      trailing: const Chip(label: Text("HOME")),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
