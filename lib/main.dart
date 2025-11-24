import 'package:flutter/material.dart';
import 'package:wisata_candi_k/models/candi.dart';
import 'package:wisata_candi_k/screens/home_screen.dart';
import 'package:wisata_candi_k/screens/profile_screen.dart';
import 'package:wisata_candi_k/screens/search_screen.dart';
import 'package:wisata_candi_k/screens/sign_in_screen.dart';
import 'package:wisata_candi_k/screens/sign_up_screen.dart';
import 'screens/detail_screen.dart';
import 'data/candi_data.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
        '/': (context) => HomeScreen(),
        '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/search': (context) => SearchScreen(),
        '/detail': (context) => DetailScreen(candi: ModalRoute.of(context)!.settings.arguments as Candi),
    },
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
      // home : SignUpScreen()
      // home : SearchScreen()
      home: HomeScreen(),
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/sign-in': (context) => SignInScreen(),
      //   '/sign-up': (context) => SignUpScreen(),
      //   '/profile': (context) => ProfileScreen(),
      //   '/search': (context) => SearchScreen(),
      //   '/detail': (context) => DetailScreen(candi: ModalRoute.of(context)!.settings.arguments as Candi),

      // },
      
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1. Deklarasi variabel
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      
      // TODO: 3. Buat properti BottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
        canvasColor: Colors.deepPurple[50]
      ), child: BottomNavigationBar(items: BottomNavigationBarItem(icon: icon))),
      // TODO: 4. Buat data dan child dari Theme 
    );
  }
}
