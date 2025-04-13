import 'package:flutter/material.dart';
import 'custom_scaffold.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
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
          'Your Offer',
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
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // ===== FILTER BOX =====
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 16),

              // ===== TRADE CARD 1 =====
              buildTradeCard(
                username: "Syukron",
                offeredWeapon: "Keris",
                offeredPrice: "Rp4.550.000",
                requestedWeapon: "Karambit",
                requestedPrice: "Rp4.760.000",
                expiresOn: "29 Mar",
              ),

              const SizedBox(height: 12),

              // ===== TRADE CARD 2 =====
              buildTradeCard(
                username: "Arya",
                offeredWeapon: "Karambit",
                offeredPrice: "Rp4.760.000",
                requestedWeapon: "Golok, Sumpit, Kujang, CASH",
                requestedPrice: "Rp2.110.000 + Rp900.000 + Rp?, CASH",
                expiresOn: "30 Mar",
                isMultiItem: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTradeCard({
    required String username,
    required String offeredWeapon,
    required String offeredPrice,
    required String requestedWeapon,
    required String requestedPrice,
    required String expiresOn,
    bool isMultiItem = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$username offered you a trade:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF74512D),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Side (Offered)
              Column(
                children: [
                  const Text("Offered:"),
                  const SizedBox(height: 6),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image),
                  ),
                  const SizedBox(height: 8),
                  Text(offeredWeapon),
                  Text(offeredPrice),
                ],
              ),

              // Arrow
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: const Icon(Icons.compare_arrows, size: 32, color: Color(0xFFA46420)),
              ),

              // Right Side (Requested)
              Column(
                children: [
                  const Text("For your:"),
                  const SizedBox(height: 6),
                  if (!isMultiItem)
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image),
                        ),
                        const SizedBox(height: 8),
                        Text(requestedWeapon),
                        Text(requestedPrice),
                      ],
                    )
                  else
                    Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      buildItem("Golok", "Rp2.110.000"),
                      buildItem("Sumpit", "Rp900.000"),
                      buildItem("Kujang", "Rp200.000"),
                      buildItem("Cash", "Rp500.000", isCash: true),
                    ],
                  )

                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Offer expires on $expiresOn"),
              Row(
                children: [
                  
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {},
                    child: const Text(
                    "Decline",
                    style: TextStyle(color: Colors.white),
                  ),

                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA46420),
                    ),
                    onPressed: () {},
                    child: const Text(
                    "Accept",
                    style: TextStyle(color: Colors.white),
                  ),

                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItem(String name, String price, {bool isCash = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isCash ? Colors.amber[100] : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isCash ? Icons.attach_money : Icons.image,
            size: isCash ? 28 : 24,
            color: isCash ? Colors.green : Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 12)),
        Text(price, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
