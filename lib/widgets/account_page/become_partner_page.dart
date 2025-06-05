import 'package:flutter/material.dart';

class BecomePartnerPage extends StatefulWidget {
  const BecomePartnerPage({super.key});

  @override
  State<BecomePartnerPage> createState() => _BecomePartnerPageState();
}

class _BecomePartnerPageState extends State<BecomePartnerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  String _selectedCategory = 'Planters';
  bool _isNotRobot = false;

  final List<Map<String, String>> _categories = [
    {'title': 'Planters', 'image': 'assets/suggested/bamboo_plant.png'},
    {'title': 'Flowers', 'image': 'assets/categories/flowers.png'},
    {'title': 'Cakes', 'image': 'assets/categories/cakes.png'},
    {'title': 'Plants', 'image': 'assets/categories/plants.png'},
    {'title': 'Chocolates', 'image': 'assets/suggested/explosion_box.png'},
    {'title': 'Balloon\nDecorations', 'image': 'assets/categories/kids.png'},
    {'title': 'Restaurants', 'image': 'assets/categories/handmade.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become A Partner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Become a FNP Planters Partner today!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Planters are the pots and vases on which plants are kept and delivered. FNP has an extensive collection of colorful ceramic, glass, plastic, and eco-friendly planters. '
                  'To be associated with the brand FNP – the partners will be subjected to rigorous audits to ensure excellent service.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Benefits to FNP Partner',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                _BenefitIcon(icon: Icons.verified, label: 'Use of brand name'),
                _BenefitIcon(icon: Icons.support_agent, label: 'FNP Website Support'),
                _BenefitIcon(icon: Icons.build, label: 'Partner Support Team'),
                _BenefitIcon(icon: Icons.currency_rupee, label: 'Timely Payments'),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Product Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                final item = _categories[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(item['image']!, fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 28),
            const Text(
              'GET IN TOUCH WITH US',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Enter your details and our partner support team will call you right back',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            _buildFormSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: '* Contact Name'),
            validator: (value) => value!.isEmpty ? 'Enter name' : null,
          ),
          TextFormField(
            controller: _mobileController,
            decoration: const InputDecoration(labelText: '* Mobile Number'),
            keyboardType: TextInputType.phone,
            validator: (value) => value!.length != 10 ? 'Enter valid mobile number' : null,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: '* Enter Email ID'),
            validator: (value) => value!.contains('@') ? null : 'Enter valid email',
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            decoration: const InputDecoration(labelText: 'Category'),
            items: _categories
                .map((cat) => DropdownMenuItem(
              value: cat['title'],
              child: Text(cat['title']!),
            ))
                .toList(),
            onChanged: (value) => setState(() => _selectedCategory = value!),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(labelText: '* Enter City'),
                  validator: (value) => value!.isEmpty ? 'Enter city' : null,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _areaController,
                  decoration: const InputDecoration(labelText: '* Enter Area'),
                  validator: (value) => value!.isEmpty ? 'Enter area' : null,
                ),
              ),
            ],
          ),
          TextFormField(
            controller: _commentController,
            decoration: const InputDecoration(labelText: 'Comments'),
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Checkbox(
                value: _isNotRobot,
                onChanged: (val) => setState(() => _isNotRobot = val!),
              ),
              const Text("I'm not a robot")
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate() && _isNotRobot) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitted successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields correctly')),
                  );
                }
              },
              child: const Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BenefitIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.deepPurple),
          const SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
