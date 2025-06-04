// File: lib/widgets/account_page/reminder_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/reminder_model.dart';
import 'reminder_list_page.dart';

/// This global list lives in memory for the entire session.
List<Reminder> reminders = [];

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? selectedRelation;
  String? selectedOccasion;
  DateTime? selectedDate;

  // When the user taps “Save,” create a Reminder model, add it to `reminders`,
  // show a SnackBar, and pushReplacement to the list page.
  void _saveReminder() {
    if (_nameController.text.isNotEmpty &&
        selectedRelation != null &&
        selectedOccasion != null &&
        selectedDate != null) {
      final newReminder = Reminder(
        name: _nameController.text,
        relation: selectedRelation!,
        occasion: selectedOccasion!,
        date: selectedDate!,
      );

      // Add to global in‐memory list:
      reminders.add(newReminder);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Saved successfully"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black87,
        ),
      );

      // Navigate to the list view, replacing this page.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ReminderListPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please complete all fields")),
      );
    }
  }

  final List<String> relations = [
    'Partner',
    'Boyfriend',
    'Girlfriend',
    'Husband',
    'Wife',
    'Brother',
    'Sister',
    'Mother',
    'Son',
    'Daughter',
    'Friend'
  ];
  final List<String> occasions = [
    'Birthday',
    'Anniversary',
    'Graduation',
    'Promotion',
    'Retirement',
    'Farewell'
  ];

  // Shows a bottom sheet with ChoiceChips for selection
  void _showBottomSheet(
      BuildContext context,
      String title,
      List<String> options,
      Function(String) onSelected,
      ) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Divider(thickness: 0.5),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: options.map((option) {
                  return ChoiceChip(
                    label: Text(option),
                    selected: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    onSelected: (_) {
                      onSelected(option);
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // Shows the date picker and writes “d-MMMM” (e.g. “4-June”) to the controller
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('d-MMMM').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reminder'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // If you want to handle going back manually:
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Banner at top
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: RichText(
                text: TextSpan(
                  text: "Save important occasions with us 👋\n",
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                      "We will remind you a week prior to plan your perfect gifts 🎁",
                      style: TextStyle(fontSize: 13.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // “Add A Quick Reminder” heading
            Text(
              'Add A Quick Reminder ⚡',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Name field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Gift Receiver's Name",
                prefixIcon: Icon(Icons.person_outline),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),

            // Relation & Occasion selectors
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showBottomSheet(
                        context,
                        'Select Relation',
                        relations,
                            (val) => setState(() => selectedRelation = val),
                      );
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.group_outlined, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            selectedRelation ?? 'Relation',
                            style: TextStyle(
                              color: selectedRelation != null
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showBottomSheet(
                        context,
                        'Select Occasion',
                        occasions,
                            (val) => setState(() => selectedOccasion = val),
                      );
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.cake_outlined, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            selectedOccasion ?? 'Occasion',
                            style: TextStyle(
                              color: selectedOccasion != null
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Date picker field
            TextField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'DD-MM',
                prefixIcon: Icon(Icons.calendar_today),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 24),

            // Save button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _saveReminder,
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
