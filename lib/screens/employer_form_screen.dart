import 'package:flutter/material.dart';
import '../employer_form.dart';
import '../themes/theme.dart';

class EmployerFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employer Info"),
        backgroundColor: skyBlueSwatch,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: EmployerForm(),
      ),
    );
  }
}