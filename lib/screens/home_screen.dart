import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:wisata_candi_k/helpers/database_helper.dart';
import 'package:wisata_candi_k/data/candi_data.dart';
import 'package:wisata_candi_k/data/candi_data.dart';
import 'package:wisata_candi_k/models/candi.dart';
import 'package:wisata_candi_k/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Candi> _candiList = []; // ✅ TAMBAHKAN
  final DatabaseHelper _dbHelper = DatabaseHelper(); // ✅ TAMBAHKAN
  bool _isLoading = true; // ✅ TAMBAHKAN

  @override
  void initState() {
    super.initState();
    _loadCandiData(); // ✅ TAMBAHKAN
  }

  Future<void> _loadCandiData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Untuk web, gunakan data static
      if (kIsWeb) {
        setState(() {
          _candiList = candiList;
          _isLoading = false;
        });
        return;
      }

      // Untuk mobile/desktop, gunakan database
      final candiListFromDb = await _dbHelper.getAllCandi();

      setState(() {
        _candiList = candiListFromDb.isNotEmpty ? candiListFromDb : candiList;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading data from database: $e');
      // Fallback ke data static jika terjadi error
      setState(() {
        _candiList = candiList;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 1 Buat appBar dengan judul Wisata Candi
      appBar: AppBar(title: Text("Wisata Candi")),
      // TODO: 2 Buat body dengan GridView.builder
      body: _isLoading // ✅ TAMBAHKAN loading indicator
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: candiList.length,
        itemBuilder: (context, index) {
          final Candi candi = candiList[index];
          // TODO: 3 Buat ItemCard sebagai return value dari GridView.builder
          return ItemCard(candi: candi);
        },
      ),
    );
  }
}
