import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'weapon_detail.dart';
import 'trade.dart';

import 'custom_scaffold.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      currentIndex: 0, // 0 = Home
      resizeToAvoidBottomInset: false,
      // AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // tinggi AppBar
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          // Posisikan logo di tengah AppBar
          title: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 40, // kamu bisa sesuaikan ukuran logo
              fit: BoxFit.contain,
            ),
          ),

          // Kosongkan actions agar title tetap di tengah
          actions: const [SizedBox()],
        ),
      ),

      // Scaffold background
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFAF8F6F), // bawah
                Color(0xFFE6DCCF), // atas
              ],
            ),
          ),

          // ======== Content Start ========
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom:
                    100.0, // beri jarak di bawah biar tidak nabrak BottomBar
              ),
              child: ListView(
                shrinkWrap: true,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Baris 1 (2 kolom)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCardIcon("Exchange", Icons.swap_horiz, context),
                      buildCardIcon("Trade", Icons.swap_horiz, context),
                    ],
                  ),

                  const SizedBox(height: 16), // Jarak antar baris
                  // Baris 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCardSearch("12", () {
                        // Aksi saat tombol sort ditekan
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) =>
                                  const Text("Pilihan sort di sini..."),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 16), // Jarak antar baris
                  // Baris 3
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items:
                        ['image1.png', 'image1.png', 'image1.png'].map((
                          imgPath,
                        ) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
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

                  // Baris 4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildWeaponCard(
                        imagePath: 'assets/images/kujang.png',
                        title: 'Katana Sakurai',
                        description: 'Pedang Jepang tajam legendaris.',
                        onMoreInfo: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeaponDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Baris 5
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildWeaponCard(
                        imagePath: 'assets/images/kujang.png',
                        title: 'Katana Sakurai',
                        description: 'Pedang Jepang tajam legendaris.',
                        onMoreInfo: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeaponDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Baris 6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildWeaponCard(
                        imagePath: 'assets/images/kujang.png',
                        title: 'Katana Sakurai',
                        description: 'Pedang Jepang tajam legendaris.',
                        onMoreInfo: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeaponDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      backgroundColor: Colors.transparent, // supaya gradient terlihat
    );
  }

  // Fungsi untuk membuat Card agar tidak duplikatif
  Widget buildCard(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: SizedBox(
        width: 300,
        height: 80,
        child: Center(
          child: ListTile(
            leading: Icon(icon, color: Colors.blue),
            title: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat Card agar tidak duplikatif
  Widget buildCardSearch(String jumlah, VoidCallback onSortPressed) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE6DCCF),
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
          // Row 1 - Icon Buku & Tombol Sort
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Kolom kiri: Icon buku dan angka
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

              // Kolom kanan: Tombol sort
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

          // Row 2 - Search bar dengan inner shadow
          Stack(
            children: [
              // Simulasi inner shadow pakai container transparan dengan gradient
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Overlay untuk efek inner shadow
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.1), // shadow halus
                      Colors.transparent,
                      Colors.transparent,
                      Color.fromRGBO(0, 0, 0, 0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Content: TextField dan icon search
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.search, color: Color(0xFF74512D)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat Card trade agar tidak duplikatif

  Widget buildCardIcon(String title, IconData icon, BuildContext context) {
    final card = Container(
      width: 190,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFE6DCCF),
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

    final interactiveCard = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap:
            title == "Trade"
                ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TradeScreen()),
                  );
                }
                : null,
        child: card,
      ),
    );

    return interactiveCard;
  }

  // Fungsi untuk membuat WeaponCard agar bisa dipakai berulang
  Widget buildWeaponCard({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onMoreInfo,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: const Color(0xFFE6DCCF),
      elevation: 6,
      child: SizedBox(
        width: 390,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Kolom kiri: Gambar senjata
              SizedBox(
                width: 110,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),

              // Kolom kanan: Teks + tombol
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul senjata
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF74512D),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Deskripsi singkat
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF74512D),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),

                    // Tombol more info
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA46420),
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

  // Tambahkan ini di dalam class widget kamu (HomePageScreen atau lainnya)
  Widget buildNavItem(
    IconData icon,
    String label,
    Widget targetScreen,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.brown),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
