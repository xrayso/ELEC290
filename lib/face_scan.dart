import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FaceCaptureScreen extends StatefulWidget {
  @override
  _FaceCaptureScreenState createState() => _FaceCaptureScreenState();
}

class _FaceCaptureScreenState extends State<FaceCaptureScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front, // Use the front camera
    );

    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  void _uploadPhoto() {
    // TODO: Implement upload to database
    // For now, display a message or a Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Upload functionality not implemented yet')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Capture and Upload Photo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: _image == null
                      ? Text('No image selected.')
                      : Image.file(
                    _image!,
                    height: 300,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _takePhoto,
                icon: Icon(Icons.camera_alt),
                label: Text('Take Photo'),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _image != null ? _uploadPhoto : null,
                icon: Icon(Icons.upload),
                label: Text('Upload Photo'),
              ),
            ],
          ),
        ));
  }
}
