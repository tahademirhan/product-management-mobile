import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_management_mobile/controller/product_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<ScanScreen> {
  final productController = Get.put(ProductController());
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderWidth: 3,
                  borderLength: 90,
                  borderRadius: 12,
                  cutOutSize: 180,
                  cutOutBottomOffset: -mediaQueryData.padding.top / 2 - 19,
                ),
              ),
              Positioned(
                top: 303 + mediaQueryData.padding.top,
                left: 120,
                child: const Text(
                  'Barkodu Okutun',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
          top(mediaQueryData),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.qrController = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (this.productController.result.value != scanData.code) {
        this.productController.result.value = scanData.code.toString();
        productController.barcodeList.add(scanData.code.toString());
      }
    });
  }

  Widget top(MediaQueryData mediaQueryData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(top: 48),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: mediaQueryData.padding.top),
                child: const Text(
                  "Barkod Oku",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Opacity(
              opacity: 0,
              child: SizedBox(
                width: 64,
                height: 44,
                child: Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
