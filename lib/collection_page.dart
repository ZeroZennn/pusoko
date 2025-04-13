import 'package:flutter/material.dart';
import 'weapon_detail.dart';
import 'custom_scaffold.dart';

class WeaponCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback? onTap;

  const WeaponCard({
    super.key,
    required this.name,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 0.65,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 💡 Lebih lonjong
          ),
          color: Colors.white,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(12.0), // ✅ Padding simetris
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  // ✅ Gambar fleksibel mengikuti tinggi card
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Rounded utk gambar
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain, // Gambar tidak terpotong
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CollectionPageScreen extends StatelessWidget {
  const CollectionPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      currentIndex: 1,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'My Weapon',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA46420), // Warna sesuai permintaan
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.help_outline, color: Colors.grey),
                  onPressed: () {
                    // Tambahkan aksi kalau mau
                  },
                ),
              ],
            ),
            // Garis Gradient
            Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF543310), // Kiri
                    Color(0xFFBA7123), // Kanan
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4), // Jarak kecil bawah garis
          ],
        ),
      ),

      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFAF8F6F), Color(0xFFE6DCCF)],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  buildCardSearch("12", () {
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (context) => const Text("Pilihan sort di sini..."),
                    );
                  }),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 4 : 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio:
                          0.65, // Menyesuaikan AspectRatio di WeaponCard
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return WeaponCard(
                        name: "Kujang",
                        imagePath: 'assets/images/kujang.png',
                        onTap: () {
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
                      );
                    },
                  ),
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
      width: double.infinity,
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
                    color: Color(0xFFA46420),
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
}
