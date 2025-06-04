// File: lib/widgets/account_page/reminder_list_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/reminder_model.dart';
import 'reminder_page.dart';

/// Reads from the same global `reminders` list declared in reminder_page.dart.
/// Make sure to import that file so Dart sees `reminders`.
///
/// You can also import the Reminder model:
/// import '../../models/reminder_model.dart';

class ReminderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Reminders"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Pop back to wherever launched this list (e.g. account page)
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // “Add New Reminder” button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: ElevatedButton.icon(
              icon: Icon(Icons.add, size: 20),
              label: Text("Add New Reminder"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                // Navigate back to the form to add another reminder:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ReminderPage()),
                );
              },
            ),
          ),

          // If there are no reminders (though this page should only show if reminders exist),
          // you could show a placeholder. But here we'll just build the list.
          Expanded(
            child: reminders.isEmpty
                ? Center(child: Text("No reminders found."))
                : ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final rem = reminders[index];
                return _ReminderCard(reminder: rem);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// A single card for each reminder, matching your screenshot’s style.
class _ReminderCard extends StatelessWidget {
  final Reminder reminder;

  const _ReminderCard({required this.reminder});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                // Left‐side date box (large day + month)
                Container(
                  width: 60,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAEFD8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${reminder.date.day}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E5A2F),
                        ),
                      ),
                      Text(
                        DateFormat('MMM').format(reminder.date).toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF5E5A2F),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),

                // Name (uppercase) + Occasion pill
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reminder.name.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF5E5A2F),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          reminder.occasion,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF5E5A2F),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                // Edit icon (just a placeholder; you can wire up editing later)
                Icon(Icons.edit_outlined, color: Color(0xFF5E5A2F)),
              ],
            ),

            SizedBox(height: 12),

            // “Send Gifts” button at the bottom, full width
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: wire up “Send Gifts” action
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color(0xFF5E5A2F),
                  side: BorderSide(color: Color(0xFF5E5A2F)),
                ),
                child: Text("Send Gifts"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
