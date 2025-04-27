import 'package:flutter/material.dart';

class Employer extends StatefulWidget {
  const Employer({super.key});

  @override
  State<Employer> createState() => _EmployerState();
}

class _EmployerState extends State<Employer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Employer Dashboard"),

      ),
      body: Text("Welcome Employer")
    );
  }
}
