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
          ),
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
              // FILTERS
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

              // SCROLLABLE CONTENT
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    buildTradeCard(
                      username: "Syukron",
                      offeredWeapon: "Keris",
                      offeredPrice: "Rp2.200.000",
                      offeredImage: "assets/images/keris.jpg",
                      requestedWeapon: "Golok",
                      requestedPrice: "Rp4.760.000",
                      requestedImage: "assets/images/golok.jpg",
                      expiresOn: "29 Mar",
                    ),
                    const SizedBox(height: 12),
                    buildTradeCard(
                      username: "Arya",
                      offeredWeapon: "Mandau",
                      offeredPrice: "Rp2.110.000",
                      offeredImage: "assets/images/mandau.jpg",
                      requestedWeapon: "",
                      requestedPrice: "",
                      expiresOn: "30 Mar",
                      isMultiItem: true,
                    ),
                  ],
                ),
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
    required String expiresOn,
    String? offeredImage,
    String? requestedWeapon,
    String? requestedPrice,
    String? requestedImage,
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
            children: [
              // Offered
              Expanded(
                child: Column(
                  children: [
                    const Text("Offered:"),
                    const SizedBox(height: 6),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: offeredImage != null
                            ? DecorationImage(
                                image: AssetImage(offeredImage),
                                fit: BoxFit.cover,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(offeredWeapon, textAlign: TextAlign.center),
                    Text(offeredPrice, textAlign: TextAlign.center),
                  ],
                ),
              ),

              // Arrow
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: const Icon(Icons.compare_arrows,
                    size: 32, color: Color(0xFFA46420)),
              ),

              // Requested
              Expanded(
                child: Column(
                  children: [
                    const Text("For your:"),
                    const SizedBox(height: 6),
                    if (!isMultiItem)
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              image: requestedImage != null
                                  ? DecorationImage(
                                      image: AssetImage(requestedImage),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(requestedWeapon ?? "", textAlign: TextAlign.center),
                          Text(requestedPrice ?? "", textAlign: TextAlign.center),
                        ],
                      )
                    else
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          buildItem("Golok", "Rp2.110.000", "assets/images/golok.jpg"),
                          buildItem("Kujang", "Rp900.000", "assets/images/kujang.png"),
                          buildItem("Sundu", "Rp900.000", "assets/images/sundu.jpg"),
                          buildItem("Cash", "Rp500.000", null, isCash: true),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text("Offer expires on $expiresOn"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {},
                child: const Text("Decline", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA46420),
                ),
                onPressed: () {},
                child: const Text("Accept", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItem(String name, String price, String? imagePath, {bool isCash = false}) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isCash ? Colors.amber[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              image: !isCash && imagePath != null
                  ? DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: isCash
                ? const Icon(Icons.attach_money, size: 28, color: Colors.green)
                : imagePath == null
                    ? const Icon(Icons.image)
                    : null,
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
          Text(price, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
