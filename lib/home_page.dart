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
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80), // tinggi AppBar
      //   child: AppBar(
      //     backgroundColor: Colors.white,
      //     elevation: 0,

      //     // Posisikan logo di tengah AppBar
      //     title: Center(
      //       child: Image.asset(
      //         'assets/images/logo.png',
      //         height: 40, // kamu bisa sesuaikan ukuran logo
      //         fit: BoxFit.contain,
      //       ),
      //     ),

      //     // Kosongkan actions agar title tetap di tengah
      //     actions: const [SizedBox()],
      //   ),
      // ),

      // Scaffold background
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE6DCCF), //
                Color(0xFFAF8F6F), // bawahatas
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
                  // profile icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/profile',
                          ); // pastikan rute sudah ada
                        },
                        child: Container(
                          width: 64,
                          height: 64,
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
                  const SizedBox(height: 36), // Jarak antar baris
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
                              builder:
                                  (context) => WeaponDetailScreen(
                                    name: "Kujang",
                                    imagePath: 'assets/images/kujang.png',
                                  ),
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
                              builder:
                                  (context) => WeaponDetailScreen(
                                    name: "Kujang",
                                    imagePath: 'assets/images/kujang.png',
                                  ),
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
                              builder:
                                  (context) => WeaponDetailScreen(
                                    name: "Kujang",
                                    imagePath: 'assets/images/kujang.png',
                                  ),
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

          Stack(
            children: [
              // Warna latar F0F0F0
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Efek inner shadow (gradient halus dari sisi luar ke tengah)
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.08),
                      Colors.black.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Konten search bar: TextField + Icon
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
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Color(0xFF5C3D1E),
                    ), // Sesuaikan dengan gambar
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
      color: Colors.white,

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
                          foregroundColor:
                              Colors.white, // <== warna teks jadi putih
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
