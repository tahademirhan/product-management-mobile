
import 'package:get/get.dart';
import 'package:product_management_mobile/client/product_client/product_client.dart';
import 'package:product_management_mobile/client/product_client/request/add_product_request.dart';

class ProductController extends GetxController {
  String testBarcode = "132141-1125-12";
  RxList<String> barcodeList = RxList([]);
  ProductClient productClient = ProductClient();
  RxString result = RxString('');


  void testAction() {
    barcodeList.add(testBarcode);
  }

  Future<void> addProduct() async {
    AddProductRequest request = AddProductRequest();
    request.barcode = barcodeList;
    await productClient.addProduct(request);
    barcodeList.clear();
    result.value = "";
  }
}