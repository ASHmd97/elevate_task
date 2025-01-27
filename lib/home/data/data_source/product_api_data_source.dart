import 'package:dio/dio.dart';
import 'package:elevate_task/home/data/models/products.dart';
import 'package:elevate_task/shared/api_constants.dart';
import 'package:elevate_task/shared/error/exception.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductsApiRemoteDataSource {
  final Dio _dio;

  const ProductsApiRemoteDataSource(this._dio);
  Future<List<Products>> getProducts() async {
    try {
      final response = await _dio.get(ApiConstants.productsEndpoint);

      return (response.data as List)
          .map((productJson) =>
              Products.fromJson(productJson as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw const RemoteException('Failed to get products');
    }
  }
}
