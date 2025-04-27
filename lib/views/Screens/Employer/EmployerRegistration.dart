import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:jobdoo/views/Screens/Employer/EmployerOtp.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CountryCode extends StatefulWidget {
  const CountryCode({super.key});

  @override
  State<CountryCode> createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  String selectedCountryCode = '+237';
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F2F9),
      appBar: AppBar(
        title: const Text("Code"),
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Progress Bar
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
              child: StepProgressIndicator(
                totalSteps: 6,
                currentStep: 1,
                size: 6,
                padding: 0,
                selectedColor: Colors.lightBlue,
                unselectedColor: Colors.grey.shade300,
                roundedEdges: const Radius.circular(10),
              ),
            ),

            /// Country Code & Phone Input
            Row(
              children: [
                /// Country Code Picker
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,

                      onSelect: (Country country) {
                        setState(() {
                          selectedCountryCode = '+${country.phoneCode}';

                        });
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      selectedCountryCode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                /// Phone Number Input
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter mobile number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(currentStep: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white, // White text
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
