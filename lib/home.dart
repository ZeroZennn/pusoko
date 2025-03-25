import 'package:flutter/material.dart';
import 'collection.dart';
import 'scanner.dart';
import 'about.dart';
import 'profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECED),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Atur tinggi AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Warna AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Warna shadow transparan
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2), // Shadow ke bawah
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Transparan agar shadow terlihat
            elevation: 0, // Hilangkan default shadow AppBar
            centerTitle: true,
            toolbarHeight: 130,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset('assets/images/logo.png', height: 50),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your weapon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.brown[700],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.circle, color: Colors.brown, size: 24),
                    SizedBox(width: 5),
                    Text('12', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: _boxDecorationWithShadow(),
                child: Center(
                  child: Text(
                    'slider image',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildBox(Icons.shopping_bag)),
                SizedBox(width: 10),
                Expanded(child: _buildBox(Icons.shopping_bag)),
              ],
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

  Widget _buildBox(IconData icon) {
    return Container(
      height: 200,
      decoration: _boxDecorationWithShadow(),
      child: Icon(icon, size: 40, color: Colors.grey),
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

  BoxDecoration _boxDecorationWithShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Warna shadow   transparan
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 2), // Posisi shadow ke bawah
        ),
      ],
    );
  }
}
