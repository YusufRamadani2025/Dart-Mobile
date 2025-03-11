import 'package:flutter/material.dart';
import 'package:fluttersliccing/homePage.dart';

void main() {
  runApp(const BoardingPage());
}

class Boarding_page extends StatelessWidget {
  const Boarding_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BoardingPage(),
    );
  }
} 

class BoardingPage extends StatelessWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
                        'assets/Background.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/assets/3969008 1.png"), // Path ke gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Title
                const Text(
                  "Minimalist Furniture",
                  style: TextStyle(
                    
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Subtitle
                const Text(
                  "Bringing Simplicity, Elegance, and Thoughtful Design to Your Home, One Piece of the Finest Quality. Elevate your living space with timeless aesthetics, crafted with precision and care, ensuring every detail enhances your comfort and style",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                // Get Started Button
                Center(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white, // Warna latar belakang tombol
      minimumSize: const Size(double.infinity, 50), // Lebar tombol
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(500), // Radius tombol
      ),
    ),
    onPressed: () {
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
      // Tambahkan fungsi untuk tombol
    },
    child: const Text(
      "Buy Now",
      style: TextStyle(
        fontSize: 18,
        color: Colors.black, // Warna teks diperbaiki menjadi putih
      ),
    ),
  ),
),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}