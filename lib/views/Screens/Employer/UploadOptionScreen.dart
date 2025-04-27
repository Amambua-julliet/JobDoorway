import 'package:flutter/material.dart';
import 'package:jobdoo/views/employer.dart';

class UploadOptionScreen extends StatelessWidget {
  const UploadOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Identity")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(
              icon: Icons.upload_file,
              label: "Upload Document",
              onTap: () {
                // Handle document upload here
              },
            ),
            const SizedBox(height: 24),
            _buildCard(
              icon: Icons.camera_alt,
              label: "Take a Photo",
              onTap: () {
                // Handle photo capture here
              },
            ),
            SizedBox(height:18.0),
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
                    MaterialPageRoute(builder: (context)=> Employer()));
              },
              child: Text("NextPage", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900
              ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.blue),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
