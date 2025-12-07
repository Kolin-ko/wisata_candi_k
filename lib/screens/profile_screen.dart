import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi_k/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO 1. Deklarasi variabel yang dibutuhkan
  bool isSignedIn = true;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Ambil data dari SharedPreferences, jika tidak ada gunakan default value
      fullName = prefs.getString('fullName') ?? '';
      userName = prefs.getString('username') ?? '';
      // Cek status isSignedIn dari SharedPreferences
      isSignedIn = prefs.getBool('isSignedIn') ?? false;
      // TODO: Nanti bisa ditambahkan untuk menghitung favorit dari database
      favoriteCandiCount = 0;
    });
  }

  // TODO 6. Implementasi fungsi SignIn
  void signIn() {
    // setState(() {
    //   isSignedIn = !isSignedIn;
    // });
    Navigator.pushNamed(context, '/signin');
  }

  // TODO 7. Implementasi fungsi SignOut
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    
    setState(() {
      isSignedIn = false;
      
    });
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil Sign Out'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.lightBlue[100],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // TODO 2. Buat bagian ProfileHeader yang berisi gambar profile
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              "images/placeholder_image.png",
                            ),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.blue[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // TODO 3. Buat bagian ProfileInfo yang berisi info profil
                SizedBox(height: 20),
                Divider(color: Colors.grey),
                SizedBox(height: 4),
                ProfileInfoItem(
                  // Icon gembok
                  icon: Icons.lock,
                  // Label "Pengguna"
                  label: 'Pengguna',
                  // Nilai dari variabel userName
                  value: userName,
                  // Warna icon kuning
                  iconColor: Colors.amber,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(Icons.lock, color: Colors.amber),
                //           SizedBox(width: 8),
                //           Text(
                //             'Pengguna',
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         ' : $userName',
                //         style: TextStyle(fontSize: 18),
                //       ),
                //     ),
                //     if (isSignedIn) Icon(Icons.edit),
                //   ],
                // ),
                SizedBox(height: 4),
                Divider(color: Colors.grey),
                SizedBox(height: 4),

                ProfileInfoItem(
                  // Icon person
                  icon: Icons.person,
                  // Label "Nama"
                  label: 'Nama',
                  // Nilai dari variabel fullName
                  value: fullName,
                  // Tampilkan icon edit hanya jika user sudah sign in
                  showEditIcon: isSignedIn,
                  // Fungsi ketika icon edit ditekan
                  onEditPressed: () {
                    // Print pesan debug ke console
                    debugPrint('Icon edit ditekan');
                  },
                  // Warna icon biru
                  iconColor: Colors.blue,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(Icons.person, color: Colors.blue),
                //           SizedBox(width: 8),
                //           Text(
                //             'Nama',
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         ' : $userName',
                //         style: TextStyle(fontSize: 18),
                //       ),
                //     ),
                //     if (isSignedIn) Icon(Icons.edit),
                //   ],
                // ),
                SizedBox(height: 4),
                Divider(color: Colors.grey),
                SizedBox(height: 4),
                  ProfileInfoItem(
                  // Icon favorite (hati)
                  icon: Icons.favorite,
                  // Label "Favorit"
                  label: 'Favorit',
                  // Tampilkan jumlah favorit jika > 0, jika tidak tampilkan string kosong
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                  // Warna icon merah
                  iconColor: Colors.red,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(Icons.favorite, color: Colors.red),
                //           SizedBox(width: 8),
                //           Text(
                //             'Favorit',
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         ' : $userName',
                //         style: TextStyle(fontSize: 18),
                //       ),
                //     ),
                //     if (isSignedIn) Icon(Icons.edit),
                //   ],
                // ),

                // TODO 4. Buat bagian ProfileAction yang berisi TextButton sign in/sign out
                SizedBox(height: 4),
                Divider(color: Colors.grey),
                SizedBox(height: 20),
                isSignedIn
                    ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                    : TextButton(onPressed: signIn, child: Text('Sign in')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
