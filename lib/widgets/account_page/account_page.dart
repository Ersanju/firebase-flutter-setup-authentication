import 'dart:io';

import 'package:firebase_setup_console/widgets/account_page/become_partner_page.dart';
import 'package:firebase_setup_console/widgets/account_page/reminder_page.dart';
import 'package:firebase_setup_console/widgets/account_page/saved_addresses_page.dart';
import 'package:firebase_setup_console/widgets/account_page/share_feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'chat_with_us.dart';
import 'decor_info_page.dart';
import 'edit_profile_page.dart';
import 'fyq_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafaf6),
      appBar: AppBar(
        title: const Text('My Account', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xfffafaf6),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Info
            ListTile(
              leading: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child:
                      _profileImage == null
                          ? Icon(
                            Icons.account_circle,
                            size: 48,
                            color: Colors.grey,
                          )
                          : null,
                ),
              ),
              title: const Text(
                'sanjay kumar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('ersanjay426@gmail.com'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Top Buttons Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.8,
                children: [
                  _AccountButton(
                    icon: Icons.local_shipping_outlined,
                    label: "My Orders",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Text("My Orders Screen"),
                        ),
                      );
                    },
                  ),
                  _AccountButton(
                    icon: Icons.notifications_outlined,
                    label: "Reminders",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReminderPage()),
                      );
                    },
                  ),
                  _AccountButton(
                    icon: Icons.chat_bubble_outline,
                    label: "Chat With Us",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatWithUs()),
                      );
                    },
                  ),
                  _AccountButton(
                    icon: Icons.favorite_border,
                    label: "Wishlist",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Text("Wishlist Screen"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Divider(height: 30, thickness: 5),

            // List Options
            const _AccountTile(
              icon: Icons.account_balance_wallet,
              label: "fnpCash ₹0",
              trailing: "New",
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),
            _AccountTile(
              icon: Icons.person_outline,
              label: "Personal Information",
              onTap: () {
                Navigator.push(
                    context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage()
                  )
                );
              },
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),

            _AccountTile(
              icon: Icons.location_on_outlined,
              label: "Saved Addresses",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedAddressesPage(),
                  ),
                );
              },
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),
            _AccountTile(
              icon: Icons.help_outline,
              label: "FAQ's",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FYQPage()),
                );
              },
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),
            const _AccountTile(
              icon: Icons.delete_outline,
              label: "Delete FNP Account",
            ),

            const Divider(height: 30, thickness: 5),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enquiries",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),

            _AccountTile(
              icon: Icons.celebration_outlined,
              label: "Birthday/ Wedding Decor",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DecorInfoPage(),
                  ),
                );
              },
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),
            _AccountTile(
              icon: Icons.work_outline,
              label: "Corporate Gifts/ Bulk Orders",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DecorInfoPage(),
                  ),
                );
              },
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),
            _AccountTile(
              icon: Icons.home_rounded,
              label: "Become a Partner",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BecomePartnerPage(),
                  ),
                );
              },
            ),
            Divider(
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey.shade300,
            ),
            _AccountTile(
              icon: Icons.feedback,
              label: 'Share app feedback',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  isScrollControlled: true,
                  builder: (_) => const FractionallySizedBox(
                    heightFactor: 0.5,
                    child: FeedbackForm(), // defined below
                  ),
                );
              },
            ),

            Divider(height: 30, thickness: 5),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                // Navigate or show privacy policy
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Privacy Policy'),
                    content: const Text('This is your privacy policy...'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))
                    ],
                  ),
                );
              },
              child: const Text("Privacy Policy", style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,)),
            ),
            Text(
              'App Version: 5.1.1',
              style: const TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Logout confirmation dialog
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Logout"),
                          content: const Text(
                            "Are you sure you want to logout?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Add your logout logic here
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFFF7043,
                  ), // Deep Orange Accent
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class _AccountButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed; // Add this

  const _AccountButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed, // Use the passed callback
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade100,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailing;
  final VoidCallback? onTap;

  const _AccountTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing:
          trailing != null
              ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  trailing!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
              : const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
