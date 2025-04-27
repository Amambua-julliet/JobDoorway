import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/Employer/EmployerConfirmPasscode.dart';

class CreatePasscodeScreen extends StatefulWidget {
  const CreatePasscodeScreen({super.key});

  @override
  State<CreatePasscodeScreen> createState() => _CreatePasscodeScreenState();
}

class _CreatePasscodeScreenState extends State<CreatePasscodeScreen> {
  List<String> _passcode = [];

  void _onKeyboardTap(String value) {
    if (_passcode.length < 4) {
      setState(() {
        _passcode.add(value);
      });
    }

    if (_passcode.length == 4) {
      final enteredCode = _passcode.join();
      print("Passcode entered: $enteredCode");

      // TODO: Navigate or validate passcode
    }
  }

  void _onDelete() {
    if (_passcode.isNotEmpty) {
      setState(() {
        _passcode.removeLast();
      });
    }
  }

  Widget _buildCircle({required bool filled}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2),
        color: filled ? Colors.blue : Colors.transparent,
      ),
    );
  }

  Widget _buildNumberButton(String value, {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => _onKeyboardTap(value),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          value,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Progress bar
              LinearProgressIndicator(
                value: 0.25, // You can change this as needed
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 40),
              /// Title
              const Text(
                "Create a passcode\nfor your JobDoorwway account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),

              /// Circle passcode indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return _buildCircle(filled: index < _passcode.length);
                }),
              ),
              const SizedBox(height: 40),

              /// Custom number pad
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5,
                  children: [
                    ...List.generate(9, (i) {
                      return _buildNumberButton('${i + 1}');
                    }),
                    const SizedBox.shrink(),
                    _buildNumberButton('0'),
                    GestureDetector(
                      onTap: _onDelete,
                      child: const Icon(Icons.backspace_outlined, size: 28),
                    ),
                  ],
                ),
              ),

              /// Disclaimer
              const Text.rich(
                TextSpan(
                  text: "By creating a passcode, you agree to our\n",
                  style: TextStyle(fontSize: 12),
                  children: [
                    TextSpan(
                      text: "Terms & Conditions",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
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
                      MaterialPageRoute(builder: (context)=> ReEnterPasscodeScreen(originalPasscode: '',)));
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
