import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: EditProfilePage()));

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: EditProfileForm(),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  String _title = 'Mr.';
  String _gender = 'Male';
  DateTime? _dob;
  DateTime? _anniversary;

  final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.grey),
  );

  Future<void> _pickDate(BuildContext context, bool isDOB) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        if (isDOB) {
          _dob = picked;
        } else {
          _anniversary = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Picture with edit icon
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const AssetImage('assets/profile_placeholder.png'), // Replace with NetworkImage or FileImage as needed
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, size: 16),
                  onPressed: () {
                    // Action to change profile picture
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Title and Name
        Row(
          children: [
            DropdownButton<String>(
              value: _title,
              items: ['Mr.', 'Ms.', 'Mrs.']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _title = val!),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: 'sanjay kumar',
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: _border,
                  focusedBorder: _border,
                  enabledBorder: _border,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Email
        TextFormField(
          initialValue: 'ersanjay426@gmail.com',
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email),
            border: _border,
            focusedBorder: _border,
            enabledBorder: _border,
          ),
        ),
        const SizedBox(height: 16),

        // Mobile Number
        Row(
          children: [
            const Text('🇮🇳 +91'),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile',
                  border: _border,
                  focusedBorder: _border,
                  enabledBorder: _border,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Gender Dropdown
        DropdownButtonFormField<String>(
          value: _gender,
          items: ['Male', 'Female', 'Other']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) => setState(() => _gender = val!),
          decoration: InputDecoration(
            labelText: 'Gender',
            border: _border,
            focusedBorder: _border,
            enabledBorder: _border,
          ),
        ),
        const SizedBox(height: 16),

        // DOB
        GestureDetector(
          onTap: () => _pickDate(context, true),
          child: AbsorbPointer(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                hintText: 'DD/MM/YYYY',
                border: _border,
                focusedBorder: _border,
                enabledBorder: _border,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              controller: TextEditingController(
                text: _dob == null
                    ? ''
                    : '${_dob!.day}/${_dob!.month}/${_dob!.year}',
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Anniversary
        GestureDetector(
          onTap: () => _pickDate(context, false),
          child: AbsorbPointer(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date of Anniversary',
                hintText: 'DD/MM/YYYY',
                border: _border,
                focusedBorder: _border,
                enabledBorder: _border,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              controller: TextEditingController(
                text: _anniversary == null
                    ? ''
                    : '${_anniversary!.day}/${_anniversary!.month}/${_anniversary!.year}',
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Save & Continue Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8D8C52),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Submit action
            },
            child: const Text('Save & Continue'),
          ),
        ),

      ],
    );
  }
}
