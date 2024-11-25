import 'package:flutter/material.dart';
import 'face_scan.dart';
import 'qr_scan.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Option'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Option for Face Scan
              ElevatedButton(
                onPressed: () {
                  // Navigate to Face Scan Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaceCaptureScreen()),
                  );
                },
                child: const Text('Upload Face Scan'),
              ),
              const SizedBox(height: 20),

              // Option for QR Code
              ElevatedButton(
                onPressed: () {
                  // Navigate to QR Scan Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GenerateQRCodePage()),
                  );
                },
                child: const Text('Use QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
