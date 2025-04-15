import 'package:flutter/material.dart';
import 'custom_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      currentIndex: 3,
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(
            color: Color(0xFF74512D),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF74512D)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),

      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 218, 204, 186), Color(0xFFAF8F6F)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === Judul Halaman ===
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  alignment: Alignment.center,
                  child: const Text(
                    "Tentang Pusoko",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFFA46420),
                    ),
                  ),
                ),

                // === Container Gabungan Deskripsi + Fitur ===
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: _boxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Apa itu Pusoko?
                      Text(
                        "Apa itu Pusoko?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Pusoko adalah aplikasi mobile yang menjadi perpustakaan digital senjata tradisional Indonesia. "
                        "Dengan teknologi pemindaian visual seperti Google Lens, pengguna dapat memindai senjata untuk mengetahui jenis dan nilai estimasinya.",
                        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Fitur Utama:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildFeatureItem("🔍 Scan senjata tradisional dan identifikasi otomatis"),
                      _buildFeatureItem("📈 Lihat estimasi nilai atau value senjata"),
                      _buildFeatureItem("🛒 Jual beli senjata melalui marketplace"),
                      _buildFeatureItem("🤝 Trading antar pengguna"),
                      _buildFeatureItem("🔐 Login & Register untuk menyimpan data dan transaksi"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // === Container Tim Pengembang ===
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: _boxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tim Pengembang:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildDeveloperProfile(
                        name: "Achmad Zikran Mauilda",
                        role: "Programmer",
                        imagePath: "assets/images/dev1.jpg",
                        quote: '"Coding adalah seni menyusun logika menjadi kenyataan."',
                      ),
                      const SizedBox(height: 30),
                      _buildDeveloperProfile(
                        name: "Muhammad Arya Maulana",
                        role: "UI/UX Designer",
                        imagePath: "assets/images/dev2.jpg",
                        quote: '"Desain bukan hanya estetika, tapi juga pengalaman."',
                      ),
                      const SizedBox(height: 30),
                      _buildDeveloperProfile(
                        name: "Muhammad Syukron Rizky Fadilla",
                        role: "Backend Engineer",
                        imagePath: "assets/images/dev3.jpg",
                        quote: '"Logika di balik layar yang membuat segalanya berjalan."',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // === Footer App Info ===
                const Center(
                  child: Column(
                    children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
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

  Widget _buildDeveloperProfile({
    required String name,
    required String role,
    required String imagePath,
    required String quote,
  }) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              quote,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram),
                onPressed: () {},
                color: Colors.pinkAccent,
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {},
                color: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
