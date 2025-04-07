import 'package:flutter/material.dart';

import '../controllers/auth_service.dart';
import 'loginPage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedRole;
  final List<String> roles = ['Job Seeker', 'Employer'];

  // Form field values
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String location = '';

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => name = value!.trim(),
                validator: (value) =>
                value!.isEmpty ? 'Enter your name' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: InputDecoration(labelText: 'Role'),
                items: roles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) => setState(() => selectedRole = value),
                validator: (value) =>
                value == null ? 'Please select a role' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value!.trim(),
                validator: (value) =>
                value!.isEmpty ? 'Enter a valid email' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phone = value!.trim(),
                validator: (value) =>
                value!.isEmpty ? 'Enter your phone number' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => password = value!,
                validator: (value) =>
                value!.length < 6 ? 'Password too short' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (value) => location = value!.trim(),
                validator: (value) =>
                value!.isEmpty ? 'Enter your location' : null,
              ),
              const SizedBox(height: 24),
              isLoading
                  ? Center(child: CircularProgressIndicator()) //
                  : ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    setState(() => isLoading = true); //

                    final result = await AuthService().signUp(
                      email: email,
                      password: password,
                      name: name,
                      phone: phone,
                      role: selectedRole!,
                      location: location,
                    );

                    setState(() => isLoading = false);

                    if (result == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign up successful!')),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result)),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
