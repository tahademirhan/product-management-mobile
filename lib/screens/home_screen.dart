import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:product_management_mobile/controller/product_controller.dart';
import 'package:product_management_mobile/screens/scan_screen.dart';
import 'package:product_management_mobile/widgets/buttoni.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 400),
              child: Buttoni(
                label: "Kamera",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Buttoni(
                label: "Test Ürünü Ekle",
                onPressed: () => productController.testAction(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Obx(
                () => Buttoni(
                  label:
                      "Taranmış ${productController.barcodeList.length} Ürünü Kaydet",
                  onPressed: productController.barcodeList.isNotEmpty
                      ? () => productController.addProduct()
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
