import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wisata_candi_k/screens/home_screen.dart';
import 'package:wisata_candi_k/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TODO 1 : Deklarasi Variabel
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _namaPenggunaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  String _errorTextFullname = '';
  String _errorTextUsername = '';
  String _errorTextPassword = '';


  // TODO : Membuat _signUp
  void _signUp(){
    String fullname = _fullnameController.text.trim();
    String username = _namaPenggunaController.text.trim();
    String password = _passwordController.text.trim(); 

    // Validasi 1 : Cek apakah semua field ada isinya
    if(fullname.isEmpty){
      setState(() {
        _errorTextFullname = "Field Nama Lengkap harus di isi!";
      });
    } else {
      setState(() {
        _errorTextFullname = '';
      });
    }
    
    if(username.isEmpty){
      setState(() {
        _errorTextUsername = "Field Username harus di isi!";
      });
    } else {
      setState(() {
        _errorTextUsername = '';
      });
    }

    if(password.isEmpty){
      setState(() {
        _errorTextPassword = "Field Password harus di isi!";
      });
    } else{
      if(password.length < 8 || !password.contains(RegExp(r'[A-Z]')) || !password.contains(RegExp(r'[a-z]')) || !password.contains(RegExp(r'[0-9]'))){
        setState(() {
          _errorTextPassword = 'Minimal 8 Karakter dengan Huruf Kapital, kecil, dan angka';
        });
      }
      else {
        setState(() {
          _errorTextPassword = '';
        });
      }
    }
  }


  
  
  // TODO : Membuat dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2 : AppBar
      appBar: AppBar(title: Text('Sign Up')),
      // TODO 3 : Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                // TODO 4 : Atur maiAxisAlignment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center, // Vertikal
                crossAxisAlignment: CrossAxisAlignment.center, // Horizontal

                children: [
                  // TODO 5 : TextFormField fullname
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(),
                      errorText: _errorTextFullname.isNotEmpty? _errorText : null,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _namaPenggunaController,
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                      errorText: _errorTextUsername.isNotEmpty? _errorText : null,
                    ),
                  ),
                  // TODO 6 : TextFormField Password
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      errorText: _errorTextPassword.isNotEmpty? _errorText : null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  // TODO 7 : Button Sign In
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: () {
                    _signUp();
                  }, child: Text('Sign Up')),

                  // TODO 8 : Text Sign Up
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: "Sudah punya akun? ",
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
