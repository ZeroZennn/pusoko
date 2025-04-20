import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'weapon_detail.dart';
import 'trade.dart';
import 'market.dart';
import 'profile.dart';


import 'custom_scaffold.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      currentIndex: 0,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE6DCCF), Color(0xFFAF8F6F)],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFA46420),
                              width: 4,
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFFA46420),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  Row(
                    children: [
                      Expanded(
                        child: buildCardIcon(
                          "Market",
                          Icons.swap_horiz,
                          context,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: buildCardIcon(
                          "Trade",
                          Icons.swap_horiz,
                          context,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  buildCardSearch("12", () {
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (context) => const Text("Pilihan sort di sini..."),
                    );
                  }, screenWidth),

                  const SizedBox(height: 16),

                  CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight * 0.25,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.85,
                    ),
                    items:
                        ['image1.png', 'image1.png', 'image1.png'].map((
                          imgPath,
                        ) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: screenWidth * 0.95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/$imgPath'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 16),

                  ...List.generate(
                    3,
                    (_) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: buildWeaponCard(
                        imagePath: 'assets/images/kujang.png',
                        title: 'Kujang',
                        description: 'Senjata tradisional khas Sunda.',
                        onMoreInfo: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const WeaponDetailScreen(
                                    name: "Kujang",
                                    imagePath: 'assets/images/kujang.png',
                                    weaponDesc:
                                        "Istilah kujang berasal dari kata ‘Kudhiyang’ dengan akar kata ‘Kudi’ dan ‘Hyang’. "
                                        "Kudi diambil dari bahasa Sunda kuno yang berarti senjata yang memiliki kekuatan gaib, "
                                        "sebagai jimat, dan sebagai penolak bala. Sedangkan, bagi masyarakat Sunda, Hyang mempunyai "
                                        "arti dan kedudukan di atas dewa.",
                                    weaponOrigin: "Jawa Barat",
                                    weaponRarity: 4,
                                  ),
                            ),
                          );
                        },
                        screenWidth: screenWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardSearch(
    String jumlah,
    VoidCallback onSortPressed,
    double width,
  ) {
    return Container(
      width: width * 0.95,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.collections_bookmark_rounded,
                    color: Color(0xFF74512D),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "12",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF74512D),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onSortPressed,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA46420),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.sort, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: const [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Color(0xFF5C3D1E)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardIcon(String title, IconData icon, BuildContext context) {
    final card = Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: const Color(0xFF74512D)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF74512D),
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
        onTap: () {
          if (title == "Trade") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TradeScreen()),
            );
          } else if (title == "Market") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MarketScreen()),
            );
          }
        },
        child: card,
      );

  }

  Widget buildWeaponCard({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onMoreInfo,
    required double screenWidth,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      elevation: 6,
      child: SizedBox(
        width: screenWidth * 0.95,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: 110,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF74512D),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF74512D),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA46420),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: onMoreInfo,
                        child: const Text("More Info"),
                      ),
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
}
