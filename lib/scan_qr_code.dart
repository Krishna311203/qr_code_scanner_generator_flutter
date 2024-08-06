import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = 'Scanned Result appears here';
  Future<void> scanQR() async {
    try {
      final Qr = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrResult = Qr.toString();
      });
    } on PlatformException {
      qrResult = 'Failed to read QR Code';
    }
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: qrResult));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to Clipboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(9, 2, 43, 0.5),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05), // Transparent background
              border: Border.all(color: Colors.white), // White border
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    qrResult,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.copy, color: Colors.white),
                  onPressed: copyToClipboard,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: scanQR,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              'Open QR Code scanner',
              style: TextStyle(color: Color(0xff0f0442)),
            ),
          )
        ],
      )),
    );
  }
}
