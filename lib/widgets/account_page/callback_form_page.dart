import 'package:flutter/material.dart';

class CallbackFormPage extends StatefulWidget {
  const CallbackFormPage({super.key});

  @override
  State<CallbackFormPage> createState() => _CallbackFormPageState();
}

class _CallbackFormPageState extends State<CallbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request a Callback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name*'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['name'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mobile Number*'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['mobile'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Occasion* (e.g., Birthday, Wedding)'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['occasion'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Preferred Date*'),
                keyboardType: TextInputType.datetime,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['date'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location*'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _formData['location'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Additional Message'),
                maxLines: 3,
                onSaved: (value) => _formData['message'] = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Callback request submitted!')),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
