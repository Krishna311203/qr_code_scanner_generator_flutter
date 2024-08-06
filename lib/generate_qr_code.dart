import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlController = TextEditingController();
  bool isQRCodeGenerated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(9, 2, 43, 0.5),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isQRCodeGenerated && urlController.text.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: QrImageView(
                            data: urlController.text,
                            size: 200,
                          ),
                        ),
                        // const SizedBox(height: 10),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: urlController,
                        decoration: InputDecoration(
                          hintText: 'Enter URL',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Enter Your Data',
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  if (isQRCodeGenerated) {
                    urlController.clear();
                    isQRCodeGenerated = false;
                  } else if (urlController.text.isNotEmpty) {
                    isQRCodeGenerated = true;
                  }
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  isQRCodeGenerated
                      ? "Create Another QR Code"
                      : "Generate QR Code",
                  style: const TextStyle(color: Color(0xff0f0442)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
