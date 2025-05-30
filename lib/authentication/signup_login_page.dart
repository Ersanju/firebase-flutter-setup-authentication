import 'package:firebase_setup_console/authentication/signup_user.dart';
import 'package:flutter/material.dart';

class SignupLoginPage extends StatelessWidget {
  const SignupLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures layout resizes with keyboard
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner with logo overlay
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Banner Image
                Image.asset(
                  'assets/images/fnp_banner.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.cover,
                ),

                // Circular FNP Logo
                Positioned(
                  bottom: -45,
                  left: MediaQuery.of(context).size.width / 2 - 45, // center horizontally
                  child: Material(
                    elevation: 8,
                    shape: const CircleBorder(),
                    shadowColor: Colors.black45,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/joy_logo.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            const Text(
              "Sign Up / Login to Joy-a-More!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "For a personalized experience & faster checkout",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter Email Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF88803D),
                  ),
                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => SignupUser()),);
                  },
                  child: const Text("Continue"),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: Divider(thickness: 1, indent: 24, endIndent: 10)),
                Text("or Login with"),
                Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 24)),
              ],
            ),
            const SizedBox(height: 16),

            Padding(
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

            const SizedBox(height: 24),

            // Terms & Conditions (in two lines)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text.rich(
                TextSpan(
                  text: 'By continuing, you agree to Joy-a-More’s\n',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(text: ' & '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
