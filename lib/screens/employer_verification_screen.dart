import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class EmployerVerificationScreen extends StatefulWidget {
  @override
  _EmployerVerificationScreenState createState() =>
      _EmployerVerificationScreenState();
}

class _EmployerVerificationScreenState extends State<EmployerVerificationScreen> {
  File? _licenseFile;
  File? _idFrontFile;
  File? _idBackFile;

  Future<void> pickFile({required bool isLicense, required bool isFront}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      setState(() {
        if (isLicense) {
          _licenseFile = file;
        } else if (isFront) {
          _idFrontFile = file;
        } else {
          _idBackFile = file;
        }
      });
    }
  }

  Widget filePreview(String label, File? file, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: file == null
                  ? Icon(Icons.upload_file, size: 40, color: Colors.blue)
                  : Text("Selected: ${file.path.split('/').last}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14)),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employer Verification")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            filePreview("Company License (PDF Only)", _licenseFile, () => pickFile(isLicense: true, isFront: false)),
            filePreview("ID Card Front (Image or PDF)", _idFrontFile, () => pickFile(isLicense: false, isFront: true)),
            filePreview("ID Card Back (Image or PDF)", _idBackFile, () => pickFile(isLicense: false, isFront: false)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Placeholder for future Firebase upload
              },
              child: Text("Continue"),
            )
          ],
        ),
      ),
    );
  }
}
