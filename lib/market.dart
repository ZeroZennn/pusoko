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
  bool oldest = true;
  bool priceMax = true;
  bool priceMin = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      currentIndex: 1,
      appBar: AppBar(
        title: const Text(
          'Weapon Market',
          style: TextStyle(
            color: Color(0xFF74512D),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.help_outline, color: Color(0xFF74512D)),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE6DCCF), Color(0xFFAF8F6F)],
            ),
          ),
          child: Column(
            children: [
              // FILTER SECTION
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 12),

              // MARKET CONTENT
              Expanded(child: MarketPageScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
