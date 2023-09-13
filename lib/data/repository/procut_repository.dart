
import 'package:dio/dio.dart';

import '../../core/api.dart';
import '../models/product_model.dart';


class ProductRepository {
  final _api = Api();

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      Response response = await _api.sendRequest.get("/product");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if(!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>).map((json) => ProductModel.fromJson(json)).toList();
    }
    catch(ex) {
      rethrow;
    }
  }

  Future<List<ProductModel>> gotAdopted(String productId) async {
    try {
      Response response = await _api.sendRequest.put("/product/$productId");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if(!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>).map((json) => ProductModel.fromJson(json)).toList();
    }
    catch(ex) {
      rethrow;
    }
  }

}