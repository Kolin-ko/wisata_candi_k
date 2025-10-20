import 'package:flutter/material.dart';
import 'package:wisata_candi_k/screens/profile_screen.dart';
import 'screens/detail_screen.dart';
import 'data/candi_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Candi di Indonesia",
      home: ProfileScreen(),
      // home : DetailScreen(candi: candiList[4],),
    );
  }
}

