import 'package:flutter/material.dart';
import 'weapon_detail.dart';

import 'custom_scaffold.dart';

class CollectionPageScreen extends StatelessWidget {
  const CollectionPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // body: Center(child: Text("Halaman Trade")),
      currentIndex: 1, // sesuaikan dengan nav bar kamu
      // AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // tinggi AppBar
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          // Posisikan logo di tengah AppBar
          title: Center(child: Text('My Collection')),

          // Kosongkan actions agar title tetap di tengah
          actions: const [SizedBox()],
        ),
      ),

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
                bottom: 100.0,
              ),

              child: ListView(
                shrinkWrap: true,
                children: [
                  // Baris 1
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
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardSearch(String jumlah, VoidCallback onSortPressed) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
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
}
