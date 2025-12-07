// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi_k/models/candi.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool isFavorite = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _checkSignInStatus(); // periksa status sign in saat layar dimuat
    _loadFavoriteStatus(); // periksa status favorit saat layar dimuat
  }

  // periksa status signin
  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool signedIn = prefs.getBool('isSignedIn') ?? false;
    setState(() {
      isSignedIn = signedIn;
    });
  }

  // periksa status favorit
  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.candi.name}') ?? false;

    setState(() {
      isFavorite = favorite;
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!isSignedIn) {
      // Jika user belum sign in, arahkan ke halaman sign in
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/signin');
      });
    }

    bool favoriteStatus = !isFavorite;
    prefs.setBool('favorite_${widget.candi.name}', favoriteStatus);

    setState(() {
      isFavorite = favoriteStatus;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.brown,
              title: Text("Detail Candi (${widget.candi.name})", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow)),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Hero(
                    tag: widget.candi.imageAsset,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        widget.candi.imageAsset,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 32.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[100]?.withValues(alpha: 100),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                // Back Button
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.candi.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                           _toggleFavorite();
                        },
                        icon: Icon(
                          isSignedIn && isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isSignedIn && isFavorite
                              ? Colors.red
                              : Colors.grey,),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // Info di tengah
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.red),
                      SizedBox(width: 8.0),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(' : ${widget.candi.location} '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.purpleAccent),
                      SizedBox(width: 8.0),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          'Dibangun pada',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(' : ${widget.candi.built} '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.house, color: Colors.lightBlue),
                      SizedBox(width: 8.0),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          'Tipe ny',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(' : ${widget.candi.type} '),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(color: Colors.deepPurple.shade300),
                  SizedBox(height: 16.0),
                  Text(widget.candi.description),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                    ],
                  ),
                  ),
                  // Info dibawah
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(color: Colors.deepOrange.shade200),
                        Text(
                          'Galeri',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                          height: 100.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.candi.imageUrls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.deepPurple.shade100,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.candi.imageUrls[index],
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                              width: 120,
                                              height: 120,
                                              color: Colors.deepPurple[50],
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Tap biar gede',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
