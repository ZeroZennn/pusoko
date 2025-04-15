import 'package:flutter/material.dart';
import 'home_page.dart';
import 'collection_page.dart';
import 'about.dart';
import 'profile.dart';
import 'scanner.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final PreferredSizeWidget? appBar;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;

  const CustomScaffold({
    super.key,
    required this.body,
    required this.currentIndex,
    this.appBar,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor,
  });

  void _navigateTo(int index, BuildContext context) {
    Widget target;
    switch (index) {
      case 0:
        target = const HomePageScreen();
        break;
      case 1:
        target = const CollectionPageScreen();
        break;
      case 2:
        return;
      case 3:
        target = const AboutScreen();
        break;
      case 4:
        target = const ProfileScreen();
        break;
      default:
        return;
    }

    if (ModalRoute.of(context)?.settings.name !=
        target.runtimeType.toString()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => target),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScannerScreen()),
            );
          },
          backgroundColor: const Color(0xFFA46420),
          elevation: 4,
          shape: const CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.camera_alt, size: 24, color: Colors.white),
              SizedBox(height: 2),
              Text('Scan', style: TextStyle(fontSize: 10, color: Colors.white)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, Icons.home, 'Home', 0),
              _buildNavItem(context, Icons.book, 'Collection', 1),
              const SizedBox(width: 40), // Space for FAB
              _buildNavItem(context, Icons.attach_file, 'About', 3),
              _buildNavItem(context, Icons.person, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _navigateTo(index, context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isSelected ? Colors.brown : Colors.grey),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? Colors.brown : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
