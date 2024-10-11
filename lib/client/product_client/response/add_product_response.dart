import 'package:product_management_mobile/client/base_response.dart';

class AddProductResponse extends BaseResponse {
  int? id;
  AddProductResponse();

  factory AddProductResponse.fromJson(Map<String, dynamic> json) {
    var res = AddProductResponse();
    res.fromJson(json);
    return res;
  }
}