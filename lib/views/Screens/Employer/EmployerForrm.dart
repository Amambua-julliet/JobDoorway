import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/Employer/UploadOptionScreen.dart';

class UserDetailsFormScreen extends StatefulWidget {
  const UserDetailsFormScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsFormScreen> createState() => _UserDetailsFormScreenState();
}

class _UserDetailsFormScreenState extends State<UserDetailsFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _companyStartDateController = TextEditingController();

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildLabel("Name"),
              _buildTextField(_nameController, "Enter your name"),

              _buildLabel("Address"),
              _buildTextField(_addressController, "Enter your address"),

              _buildLabel("Region"),
              _buildTextField(_regionController, "Enter your region"),

              _buildLabel("Postal Code"),
              _buildTextField(_postalCodeController, "Enter your postal code", keyboardType: TextInputType.number),

              _buildLabel("Gender"),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: ["Male", "Female", "Other"]
                    .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedGender = value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select gender",
                ),
                validator: (value) => value == null ? "Please select gender" : null,
              ),

              _buildLabel("Company Start Date"),
              _buildTextField(_companyStartDateController, "YYYY-MM-DD"),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>UploadOptionScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Next Page"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: (value) => value == null || value.isEmpty ? "Required field" : null,
    );
  }
}
