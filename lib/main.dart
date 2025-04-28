import 'package:flutter/material.dart';
import 'screens/employer_form_screen.dart';
import 'screens/employer_verification_screen.dart';

void main() {
  runApp(const JobDoorwayApp());
}

class JobDoorwayApp extends StatelessWidget {
  const JobDoorwayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Doorway',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 1,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => EmployerFormScreen(),
        '/verify': (context) => EmployerVerificationScreen(),
      },
    );
  }
}
