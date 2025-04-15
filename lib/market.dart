import 'package:flutter/material.dart';
import 'home_page.dart';
import 'home.dart';
import 'collection.dart';
import 'scanner.dart';
import 'about.dart';
import 'profile.dart';
import 'market_page.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  bool newest = true;
  bool oldest = true;
  bool priceMax = true;
  bool priceMin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECED),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Weapon Market",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.brown[700],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.help_outline, color: Colors.brown),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // FILTERS SECTION
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  value: newest,
                  onChanged: (val) => setState(() => newest = val!),
                  title: const Text("Newest"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value: oldest,
                  onChanged: (val) => setState(() => oldest = val!),
                  title: const Text("Oldest"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value: priceMax,
                  onChanged: (val) => setState(() => priceMax = val!),
                  title: const Text("Price: MAX"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value: priceMin,
                  onChanged: (val) => setState(() => priceMin = val!),
                  title: const Text("Price: MIN"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // MARKET CONTENT
          Expanded(child: MarketPageScreen()),
        ],
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

  static Widget _buildNavItem(
    IconData icon,
    String label,
    BuildContext context,
    Widget screen,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, size: 34),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 0)),
      ],
    );
  }
}
