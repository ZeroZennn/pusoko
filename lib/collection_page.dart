import 'package:flutter/material.dart';
import 'weapon_detail.dart';
import 'custom_scaffold.dart';

class WeaponCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String weaponDesc;
  final String weaponOrigin;
  final int weaponRarity;
  final VoidCallback? onTap;

  const WeaponCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.weaponDesc,
    required this.weaponOrigin,
    required this.weaponRarity,
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
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar dalam rasio tetap
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover, // Penuhi seluruh area
                      ),
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

class CollectionPageScreen extends StatefulWidget {
  const CollectionPageScreen({super.key});

  @override
  State<CollectionPageScreen> createState() => _CollectionPageScreenState();
}

class _CollectionPageScreenState extends State<CollectionPageScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _animations;

  final List<Map<String, dynamic>> weapons = [
    {
      "name": "Kujang",
      "imagePath": "assets/images/kujang.png",
      "desc":
          "Senjata tradisional khas Sunda, digunakan sebagai alat pertanian dan simbol kekuatan.",
      "origin": "Jawa Barat",
      "rarity": 5,
    },
    {
      "name": "Keris",
      "imagePath": "assets/images/keris.jpg",
      "desc":
          "Senjata tikam khas Nusantara dengan bentuk bilah berkelok dan nilai spiritual tinggi.",
      "origin": "Jawa Tengah",
      "rarity": 4,
    },
    {
      "name": "Celurit",
      "imagePath": "assets/images/celurit.png",
      "desc":
          "Senjata tajam berbentuk melengkung yang digunakan oleh masyarakat Madura.",
      "origin": "Madura",
      "rarity": 3,
    },
    {
      "name": "Rencong",
      "imagePath": "assets/images/rencong.jpg",
      "desc":
          "Senjata tradisional yang menjadi simbol keberanian masyarakat Aceh.",
      "origin": "Aceh",
      "rarity": 4,
    },
    {
      "name": "Mandau",
      "imagePath": "assets/images/mandau.jpg",
      "desc":
          "Senjata suku Dayak Kalimantan yang digunakan untuk berburu dan bertarung.",
      "origin": "Kalimantan",
      "rarity": 5,
    },
    {
      "name": "Sundu",
      "imagePath": "assets/images/sundu.jpg",
      "desc":
          "Senjata tradisional dari Sulawesi dengan bentuk khas dan ukiran etnik.",
      "origin": "Sulawesi",
      "rarity": 3,
    },
    {
      "name": "Dohong",
      "imagePath": "assets/images/dohong.jpg",
      "desc": "Senjata pendek seperti pisau yang digunakan oleh suku Dayak.",
      "origin": "Kalimantan Tengah",
      "rarity": 2,
    },
    {
      "name": "Golok",
      "imagePath": "assets/images/golok.jpg",
      "desc":
          "Alat multifungsi untuk bertani dan bertahan hidup, dikenal luas di seluruh Nusantara.",
      "origin": "Betawi / Jawa Barat",
      "rarity": 2,
    },
    {
      "name": "Wedhung",
      "imagePath": "assets/images/wedhung.jpg",
      "desc":
          "Untuk membedakan antara kedua wedhung ini adalah mata pisaunya. Mata pisau dari wedhung Cirebon tidak ada dan terkesan cukup polos. Sedangkan untuk mata pisau dari wedhung Bali mempunyai motif – motif yang sangat apik. Material dari wedhung ini terbuat dari logam. Sedangkan untuk sarung / penutupnya terbuat dari kayu.",
      "origin": "Bali",
      "rarity": 3,
    },
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      9,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _animations =
        _controllers.map((controller) {
          return Tween<Offset>(
            begin: const Offset(0, 0.2),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
        }).toList();

    _startStaggeredAnimation();
  }

  void _startStaggeredAnimation() async {
    for (var i = 0; i < _controllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
                  color: Color(0xFFA46420),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.help_outline, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF543310), Color(0xFFBA7123)],
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 218, 204, 186), Color(0xFFAF8F6F)],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      childAspectRatio: 0.65,
                    ),
                    itemCount: weapons.length,
                    itemBuilder: (context, index) {
                      final weapon = weapons[index];
                      final name = weapon['name'];
                      return SlideTransition(
                        position: _animations[index],
                        child: FadeTransition(
                          opacity: _controllers[index],
                          child: WeaponCard(
                            name: name,
                            imagePath: weapon['imagePath'],
                            weaponDesc: weapon['desc'],
                            weaponOrigin: weapon['origin'],
                            weaponRarity: weapon['rarity'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => WeaponDetailScreen(
                                        name: name,
                                        imagePath: weapon['imagePath'],
                                        weaponDesc: weapon['desc'],
                                        weaponOrigin: weapon['origin'],
                                        weaponRarity: weapon['rarity'],
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
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
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
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
