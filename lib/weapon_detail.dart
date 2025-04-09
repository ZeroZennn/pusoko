import 'package:flutter/material.dart';

class WeaponDetailScreen extends StatelessWidget {
  const WeaponDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weapon Detail"),
        backgroundColor: const Color(0xFFA46420),
      ),
      body: const Center(
        child: Text(
          "Detail Senjata Akan Ditampilkan di Sini",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
