import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Ambil gambar dari galeri
  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Ambil gambar dari kamera
  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Scan",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: _image != null
                  ? Image.file(_image!)
                  : Icon(Icons.image_outlined, size: 100, color: Colors.grey),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol Image (galeri)
                _bottomButton(
                  icon: Icons.image,
                  label: "Image",
                  onTap: _getImageFromGallery,
                  isActive: false,
                ),
                // Tombol Scan (kamera)
                _bottomButton(
                  icon: Icons.camera_alt,
                  label: "Scan",
                  onTap: _getImageFromCamera,
                  isActive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.brown : const Color(0xfffdf8ee),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.brown.withOpacity(0.2)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.brown),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
