import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:product_management_mobile/client/product_client/request/add_product_request.dart';
import 'package:product_management_mobile/client/product_client/response/add_product_response.dart';
import 'package:product_management_mobile/client/url_const.dart';

class ProductClient {
  final _options = Options(
    headers: {'Content-Type': 'application/json'},
    sendTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
  );

  Future<AddProductResponse> addProduct(AddProductRequest request) async {
    var post = await Dio().post(
      UrlConst.addProduct,
      data: jsonEncode(request.toJson()),
      options: _options,
    );
    return AddProductResponse.fromJson(post.data);
  }
}
