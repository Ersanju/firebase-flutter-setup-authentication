import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignupUser extends StatefulWidget {
  @override
  _SignupUserState createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String countryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/fnp_banner.png', // Your full banner image
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter, // show top half
                  ),
                ),
                Positioned.fill(
                  bottom: -45,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      elevation: 8,
                      shape: const CircleBorder(),
                      shadowColor: Colors.black45,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/joy_logo.png',
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Welcome To FNP!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Happiness is just a click away',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (code) => countryCode = code.dialCode ?? '+91',
                        initialSelection: 'IN',
                        favorite: ['+91', 'IN'],
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: 'Enter mobile number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF808000), // olive green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Handle submission
                      },
                      child: Text("Start Gifting", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("or Login with"),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      // Handle Google login
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton.icon(
                          icon: Image.asset(
                            'assets/images/google_logo.png',
                            height: 24,
                          ),
                          label: const Text("Login with Google"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'By continuing you agree to FNP’s\nTerms & Conditions & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
