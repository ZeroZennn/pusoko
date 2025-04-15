import 'package:flutter/material.dart';

class MarketPageScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weapons = [
    {
      "name": "Kujang",
      "imagePath": "assets/images/kujang.png",
      "price": 1500000,
    },
    {
      "name": "Keris",
      "imagePath": "assets/images/keris.jpg",
      "price": 1800000,
    },
    {
      "name": "Celurit",
      "imagePath": "assets/images/celurit.png",
      "price": 950000,
    },
    {
      "name": "Rencong",
      "imagePath": "assets/images/rencong.jpg",
      "price": 1200000,
    },
    {
      "name": "Mandau",
      "imagePath": "assets/images/mandau.jpg",
      "price": 2000000,
    },
    {
      "name": "Sundu",
      "imagePath": "assets/images/sundu.jpg",
      "price": 1100000,
    },
    {
      "name": "Dohong",
      "imagePath": "assets/images/dohong.jpg",
      "price": 980000,
    },
    {
      "name": "Golok",
      "imagePath": "assets/images/golok.jpg",
      "price": 1050000,
    },
    {
      "name": "Wedhung",
      "imagePath": "assets/images/wedhung.jpg",
      "price": 990000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 218, 204, 186), Color(0xFFAF8F6F)],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView.builder(
        itemCount: weapons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final weapon = weapons[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        weapon["imagePath"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    weapon["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF5C3D1E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Rp ${weapon["price"].toString()}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
