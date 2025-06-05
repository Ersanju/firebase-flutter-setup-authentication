import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Privacy Policy

Effective Date: June 5, 2025

Thank you for using our application. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our mobile application.

1. Information We Collect:
We collect the following types of information:
- Personal Information: Your name, email address, phone number, delivery address, and payment details.
- Order Information: Products purchased, order status, and delivery history.
- Usage Data: App interactions, preferences, and feedback submissions.

2. How We Use Your Information:
We use your information to:
- Process and deliver your orders.
- Communicate order updates, offers, and support.
- Improve our services and personalize your app experience.
- Prevent fraud and ensure secure transactions.

3. Information Sharing:
We do not sell your personal information. We may share data with:
- Delivery partners and vendors for order fulfillment.
- Payment gateways for secure transactions.
- Legal authorities, when required by law.

4. Data Security:
We use industry-standard security practices to protect your data, including encryption and secure servers.

5. Your Rights:
You may:
- Access or update your information in the app.
- Request deletion of your account and data.
- Opt out of marketing communications.

6. Children’s Privacy:
We do not knowingly collect data from children under 13. If found, such data will be deleted.

7. Changes to This Policy:
We may update this Privacy Policy from time to time. You will be notified of significant changes within the app.

8. Contact Us:
For questions or concerns, contact us at:
support@yourapp.com
''',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
        ),
      ),
    );
  }
}
