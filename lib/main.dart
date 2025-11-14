import 'package:flutter/material.dart';
import 'package:wisata_candi_k/screens/profile_screen.dart';
import 'package:wisata_candi_k/screens/sign_in_screen.dart';
import 'package:wisata_candi_k/screens/sign_up_screen.dart';
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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color : Colors.deepPurple, opacity: 21),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: 
        ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true
      ),
      // home: ProfileScreen()
      // home : DetailScreen(candi: candiList[4],),
      home : SignUpScreen()
    );
  }
}

