import 'package:flutter/material.dart';
import 'home.dart';
import 'scanner.dart';
import 'about.dart';
import 'profile.dart';

class CollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECED), // Warna latar belakang
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
              "My Weapon",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.brown[700],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.help_outline, color: Colors.brown),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kotak informasi jumlah senjata & pencarian
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.menu_book, color: Colors.brown, size: 30),
                  SizedBox(width: 8),
                  Text(
                    '9',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.search, color: Colors.grey, size: 28),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Grid koleksi senjata
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 kolom
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Proporsi kotak lebih tinggi
                ),
                itemCount: 9, // Jumlah item dalam koleksi
                itemBuilder: (context, index) {
                  return _buildWeaponCard();
                },
              ),
            ),
          ],
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

  Widget _buildWeaponCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300], // Placeholder gambar
              child: Icon(Icons.image, size: 50, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Kujang",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
