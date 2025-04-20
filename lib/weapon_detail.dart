import 'package:flutter/material.dart';

class WeaponDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String weaponDesc;
  final String weaponOrigin;
  final int weaponRarity;

  const WeaponDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.weaponDesc,
    required this.weaponOrigin,
    required this.weaponRarity,
  });

  void _showWeaponBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder:
              (_, controller) => SingleChildScrollView(
                controller: controller,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Asal: $weaponOrigin",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          weaponRarity,
                          (index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(
                              Icons.star,
                              color: Color(0xFF543310),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        weaponDesc,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                          backgroundColor: const Color(0xFF543310),
                        ),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DCCF),
      body: Stack(
        children: [
          // Gambar senjata dengan rasio tetap
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                100,
                20,
                100,
              ), // padding kiri, atas, kanan, bawah
              child: AspectRatio(
                aspectRatio:
                    3 / 4, // Rasio :1 (persegi), bisa diganti sesuai kebutuhan
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
          ),

          // Tombol kembali di pojok kiri atas
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Tombol-tombol capsule
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: [
                _CapsuleIconButton(icon: Icons.star, label: '$weaponRarity'),
                const SizedBox(width: 10),
                _CapsuleIconButton(icon: Icons.language, label: '1'),
              ],
            ),
          ),

          // Tombol detail di bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () => _showWeaponBottomSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF543310),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "Detail Senjata",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CapsuleIconButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CapsuleIconButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[800]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          // const Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
