import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  final void Function(Map<String, String>) onSave;

  const AddAddressPage({super.key, required this.onSave});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Address"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Receiver’s Contact", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Receiver's Name*"),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['name'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Receiver's Mobile Number*"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['mobile'] = value!,
              ),
              const SizedBox(height: 20),
              const Text("Receiver’s Address", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Apartment, Flat, House no.*"),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['house'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Area, Street, Sector, Village*"),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['street'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Landmark"),
                onSaved: (value) => _formData['landmark'] = value ?? '',
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Select Pincode*"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['pincode'] = value!,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSave(_formData);
                    Navigator.pop(context); // optional pop
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF787430),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Save & Continue", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
