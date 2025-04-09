import 'package:flutter/material.dart';
import 'home.dart';
import 'collection.dart';
import 'scanner.dart';
import 'profile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECED),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Tentang Pusoko",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.brown[700],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apa itu Pusoko?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Pusoko adalah aplikasi mobile yang menjadi perpustakaan digital senjata tradisional Indonesia. "
                  "Dengan teknologi pemindaian visual seperti Google Lens, pengguna dapat memindai senjata untuk mengetahui jenis dan nilai estimasinya.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
                SizedBox(height: 20),
                Text(
                  "Fitur Utama:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                  ),
                ),
                SizedBox(height: 10),
                _buildFeatureItem("🔍 Scan senjata tradisional dan identifikasi otomatis"),
                _buildFeatureItem("📈 Lihat estimasi nilai atau value senjata"),
                _buildFeatureItem("🛒 Jual beli senjata melalui marketplace"),
                _buildFeatureItem("🤝 Trading antar pengguna"),
                _buildFeatureItem("🔐 Login & Register untuk menyimpan data dan transaksi"),
                SizedBox(height: 30),
                Text(
                  "Versi 1.0.0",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  "Dikembangkan oleh Tim Pusoko © 2025",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(child: _buildNavItem(Icons.home, "Home", context, HomeScreen())),
              Flexible(child: _buildNavItem(Icons.book, "Collection", context, CollectionScreen())),
              Spacer(),
              Flexible(child: _buildNavItem(Icons.info, "About", context, AboutScreen())),
              Flexible(child: _buildNavItem(Icons.person, "Profile", context, ProfileScreen())),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        shape: CircleBorder(),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => ScannerScreen())),
        child: Icon(Icons.camera_alt, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, BuildContext context, Widget screen) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, size: 34),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => screen)),
        ),
        Text(label, style: TextStyle(fontSize: 0)),
      ],
    );
  }
}
