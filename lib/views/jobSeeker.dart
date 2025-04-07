import 'package:flutter/material.dart';

class Jobseeker extends StatefulWidget {
  const Jobseeker({super.key});

  @override
  State<Jobseeker> createState() => _JobseekerState();
}

class _JobseekerState extends State<Jobseeker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JobSeeker DashBoard"),
      ),
      body: Text('Welcome JobSeeker'),
    );
  }
}
