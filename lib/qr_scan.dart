import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';



class GenerateQRCodePage extends StatefulWidget {
  const GenerateQRCodePage({Key? key}) : super(key: key);

  @override
  State<GenerateQRCodePage> createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  String _qrData = '';

  @override
  void initState() {
    super.initState();
    _generateRandomQRCode();
  }

  void _generateRandomQRCode() {
    setState(() {
      _qrData = _generateRandomString(16); // Generates a random 16-character string
    });
  }

  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random rnd = Random.secure();
    return String.fromCharCodes(
      Iterable.generate(
        length,
            (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  void _sendToDatabase() {
    // TODO: Implement database upload functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('QR code data sent to database (not implemented yet).'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Display the QR code
            if (_qrData.isNotEmpty)
              QrImageView(
                data: _qrData,
                version: QrVersions.auto,
                size: 250,
                backgroundColor: Colors.white,
              )
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            // Display the QR code data
            Text(
              'QR Code Data:\n$_qrData',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            // Button to send QR code data to the database
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _sendToDatabase,
                icon: const Icon(Icons.send),
                label: const Text('Send to Database'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      // Floating action button to generate a new QR code
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomQRCode,
        child: const Icon(Icons.refresh),
        tooltip: 'Generate New QR Code',
      ),
    );
  }
}
