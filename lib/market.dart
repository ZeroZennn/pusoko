import 'package:flutter/material.dart';
import 'custom_scaffold.dart';
import 'market_page.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  bool newest = true;
  bool oldest = false;
  bool priceMax = false;
  bool priceMin = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      currentIndex: 1,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEEDFC4), Color(0xFFAF8F6F)],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Weapon Market",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA46420),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: newest,
                        onChanged: (val) => setState(() {
                          newest = val!;
                          oldest = priceMax = priceMin = false;
                        }),
                        title: const Text("Newest"),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: oldest,
                        onChanged: (val) => setState(() {
                          oldest = val!;
                          newest = priceMax = priceMin = false;
                        }),
                        title: const Text("Oldest"),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: priceMax,
                        onChanged: (val) => setState(() {
                          priceMax = val!;
                          newest = oldest = priceMin = false;
                        }),
                        title: const Text("Price: MAX"),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: priceMin,
                        onChanged: (val) => setState(() {
                          priceMin = val!;
                          newest = oldest = priceMax = false;
                        }),
                        title: const Text("Price: MIN"),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Market list
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: MarketPageScreen(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}