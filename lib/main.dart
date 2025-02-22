import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_mobile/model/Sample.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Sample? results;

  Future<void> _loadJsonSample() async {
    String jsonString = await rootBundle.loadString('assets/sample.json');
    final jsonData = jsonDecode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      results = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fundamental Parsing Json',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fundamental Parsing Json'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  _loadJsonSample();
                },
                child: const Text(
                  'Read JSON Data'
                  ),
              ),
              const SizedBox(
                height: 12.0
                ),
              if (results != null) // Check if data is loaded
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${results?.github?.username}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Name: ${results!.Name}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Age: ${results!.Age}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Hobby: ${results?.Hobby}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Harga: ${results!.Harga}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Penerbit: ${results!.Penerbit}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Pengarang: ${results!.Pengarang}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Jumlahhal: ${results!.Jumlahhal}', style: const TextStyle(fontSize: 22.0)),
                      // Text('Cetakanke: ${results!.Cetakanke}', style: const TextStyle(fontSize: 22.0)),
                    ],
                  ),
                )
              else
                const Text('Im Sorry Not Data', style: TextStyle(fontSize: 22.0)),
            ],
          ),
        ),
      ),
    );
  }
}