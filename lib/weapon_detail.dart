import 'package:flutter/material.dart';

class WeaponDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;

  const WeaponDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
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
                      // Garis header
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Nama senjata
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Rarity (belah ketupat)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(
                              Icons.diamond,
                              color: Color(0xFF543310),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Deskripsi senjata
                      const Text(
                        "Istilah kujang berasal dari kata ‘Kudhiyang’ dengan akar kata ‘Kudi’ dan ‘Hyang’. "
                        "Kudi diambil dari bahasa Sunda kuno yang berarti senjata yang memiliki kekuatan gaib, "
                        "sebagai jimat, dan sebagai penolak bala. Sedangkan, bagi masyarakat Sunda, Hyang mempunyai "
                        "arti dan kedudukan di atas dewa.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 30),
                      // Tombol close
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                          backgroundColor: const Color(0xFF543310),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24,
                        ),
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
          // Hiasan tombol di atas halaman
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _CapsuleIconButton(icon: Icons.menu_book, label: '0'),
                const SizedBox(width: 10),
                _CapsuleIconButton(icon: Icons.language, label: '1'),
              ],
            ),
          ),
          // Gambar utama
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
          // Tombol buka Bottom Sheet
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

// Widget tambahan untuk tombol kapsul di bagian atas
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
          const Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
