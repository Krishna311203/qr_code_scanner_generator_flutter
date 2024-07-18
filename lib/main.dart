// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner_generator_flutter/generate_qr_code.dart';
import 'package:qr_code_scanner_generator_flutter/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR CODE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 2, 43, 0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('assets/homeIcon.png'),
                width: 200,
              ),
            ),
            SizedBox(height: 200),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScanQRCode(),
                    ));
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(200, 50),
                ),
                child: Text(
                  'Scan QR Code',
                  style: TextStyle(color: Color(0xff0f0442)),
                )),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GenerateQRCode(),
                    ));
                  });
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0, minimumSize: Size(200, 50)),
                child: Text(
                  'Generate QR Code',
                  style: TextStyle(color: Color(0xff0f0442)),
                )),
          ],
        ),
      ),
    );
  }
}
