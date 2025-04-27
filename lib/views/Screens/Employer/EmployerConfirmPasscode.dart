import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/Employer/EmployerForrm.dart';

class ReEnterPasscodeScreen extends StatefulWidget {
  final String originalPasscode; // Passcode from previous screen

  const ReEnterPasscodeScreen({Key? key, required this.originalPasscode})
      : super(key: key);

  @override
  State<ReEnterPasscodeScreen> createState() => _ReEnterPasscodeScreenState();
}

class _ReEnterPasscodeScreenState extends State<ReEnterPasscodeScreen> {
  List<String> enteredDigits = [];

  void _onKeyTap(String value) {
    if (enteredDigits.length < 4) {
      setState(() {
        enteredDigits.add(value);
      });

      if (enteredDigits.length == 4) {
        final enteredPasscode = enteredDigits.join();
        if (enteredPasscode == widget.originalPasscode) {
          // Passcode matched
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Passcode matched! Navigating...")),
          );

          // TODO: Navigate to the next screen
        } else {
          // Passcode didn't match
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Passcodes don’t match. Try again.")),
          );
          setState(() {
            enteredDigits.clear();
          });
        }
      }
    }
  }

  void _onBackspace() {
    if (enteredDigits.isNotEmpty) {
      setState(() {
        enteredDigits.removeLast();
      });
    }
  }

  Widget _buildPasscodeDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
            (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            color: index < enteredDigits.length ? Colors.blue : Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    List<String> numbers = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '', '0', '←',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) {
        String key = numbers[index];
        if (key == '') return SizedBox.shrink();

        return GestureDetector(
          onTap: () {
            if (key == '←') {
              _onBackspace();
            } else {
              _onKeyTap(key);
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: key == '←' ? Colors.grey.shade300 : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: key == '←'
                ? Icon(Icons.backspace, size: 24)
                : Text(
              key,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: 1.0, // Final step
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 40),
              Text(
                "Confirm  your passcode",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              _buildPasscodeDots(),
              SizedBox(height: 60),
              _buildNumberPad(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50), // width: 200, height: 50
                  backgroundColor: Colors.lightBlue, // background color
                  foregroundColor: Colors.white, // text color
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // rounded corners
                  ),
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> UserDetailsFormScreen()));
                },
                child: Text("NextPage", style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
