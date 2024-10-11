class AddProductRequest {
  List<String>? barcode;

  toJson() {
    return {
      'barcodeList': barcode
    };
  }
}