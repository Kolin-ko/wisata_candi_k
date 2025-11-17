import 'package:flutter/material.dart';
import 'package:wisata_candi_k/data/candi_data.dart';
import 'package:wisata_candi_k/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO 1. Deklarasi variabel yang diperlukan
  List<Candi> _filteredCandis = candiList;
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Buat appBar untuk judul Pencarian Candi
      appBar: AppBar(title: Text("Pencarian Candi")),

      // TODO 3. Buat body yang berisikan Column
      body: Column(
        children: [
          // TODO 4. Buat TextField pencarian Candi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyan[100],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Candi',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  
                ),
              ),
            ),
          ),
          // TODO 5. Buat ListView hasil pencarian Candi
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(candi.imageAsset, fit : BoxFit.cover,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(candi.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height : 4),
                          Text(candi.location)
                        ],
                      ),
                    )
                  ],
                )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

              