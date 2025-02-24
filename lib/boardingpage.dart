import 'package:flutter/material.dart';

class Boarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Decoration App', // Judul aplikasi
      theme: ThemeData( // Tema umum aplikasi
        primarySwatch: Colors.blue,
      ),
      home: boarding(),
      routes: { // Rute navigasi
        '/boarding': (context) => BoardingScreen(),
      },
    );
  }
}

class boarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/Rumah.png'
              ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'MAKE YOUR\nHOME BEAUTIFUL',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'The best simple place where you\ndiscover most wonderful furnitures and\nmake your home beautiful',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 400.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/boarding'); // Navigasi ke BoardingScreen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boarding'), // Judul AppBar
        backgroundColor: Colors.black, // Warna AppBar
      ),
      body: Center(
        child: Text('Ini adalah halaman Boarding!', style: TextStyle(fontSize: 20)), // Konten halaman Boarding
      ),
    );
  }
}