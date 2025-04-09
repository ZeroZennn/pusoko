import 'package:flutter/material.dart';

import 'custom_scaffold.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(child: Text("Halaman Trade")),
      currentIndex: 6, // sesuaikan dengan nav bar kamu
    );
  }
}
