import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/Employer/EpasswordGeneration.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OtpScreen extends StatefulWidget {
  final int currentStep;
  const OtpScreen({super.key, required this.currentStep});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> otpDigits = List.filled(6, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StepProgressIndicator(
              totalSteps: 6,
              currentStep: widget.currentStep,
              size: 4,
              selectedColor: Colors.lightBlue,
              unselectedColor: Colors.grey,
              roundedEdges: const Radius.circular(10),
            ),
            const SizedBox(height: 40),
            const Text(
              'Enter the 6-digit code sent to your phone',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            /// OTP input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          otpDigits[index] = value;
                        });
                        // Move to next field if not last
                        if (index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      }
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF8237A5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF8237A5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF8237A5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),

            /// Verify button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => CreatePasscodeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
