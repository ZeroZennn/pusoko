import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE6DCCF), // atas
              Color(0xFFAF8F6F), // bawah
            ],
          ),
        ),

        // ======== Content Start ========
        child: const Center(
          child: Text(
            "Selamat Datang di Pusoko!",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // supaya gradient terlihat
    );
  }
}
