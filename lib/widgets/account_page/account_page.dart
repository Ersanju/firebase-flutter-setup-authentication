import 'package:flutter/material.dart';

import 'chat_with_us.dart';
import 'edit_profile_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
              leading: const Icon(Icons.account_circle, size: 48),
              title: const Text('sanjay kumar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('ersanjay426@gmail.com'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfilePage()
                    ),
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
                        MaterialPageRoute(builder: (context) => Text("My Orders Screen")),
                      );
                    },
                  ),
                  _AccountButton(
                    icon: Icons.notifications_outlined,
                    label: "Reminders",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Text("Reminders Screen")),
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
                        MaterialPageRoute(builder: (context) => Text("Wishlist Screen")),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Divider(height: 30),

            // List Options
            const _AccountTile(
                icon: Icons.account_balance_wallet,
                label: "fnpCash ₹0",
                trailing: "New"),
            const _AccountTile(
                icon: Icons.person_outline, label: "Personal Information"),
            const _AccountTile(
                icon: Icons.location_on_outlined, label: "Saved Addresses"),
            const _AccountTile(icon: Icons.help_outline, label: "FAQ's"),
            const _AccountTile(
                icon: Icons.delete_outline, label: "Delete FNP Account"),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Enquiries",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),

            const _AccountTile(
                icon: Icons.celebration_outlined,
                label: "Birthday/ Wedding Decor"),
            const _AccountTile(
                icon: Icons.work_outline, label: "Corporate Gifts/ Bulk Orders"),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _AccountButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;  // Add this

  const _AccountButton({required this.icon, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,  // Use the passed callback
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

  const _AccountTile({required this.icon, required this.label, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: trailing != null
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.pink, Colors.orange]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(trailing!,
            style: const TextStyle(color: Colors.white, fontSize: 12)),
      )
          : const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
