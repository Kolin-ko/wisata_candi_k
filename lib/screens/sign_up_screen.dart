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
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _namaPenggunaController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

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
                  // TODO 5 : TextFormField Username
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _namaPenggunaController,
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO 6 : TextFormField Password
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      errorText: _errorText.isNotEmpty ? _errorText : null,
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
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => HomeScreen()));
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
