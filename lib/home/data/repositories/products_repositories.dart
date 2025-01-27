import 'package:elevate_task/home/data/data_source/product_api_data_source.dart';
import 'package:elevate_task/home/data/models/products.dart';
import 'package:elevate_task/shared/error/exception.dart';
import 'package:elevate_task/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';

@singleton
class ProductsRepositories {
  final ProductsApiRemoteDataSource productsApiRemoteDataSource;

  ProductsRepositories(this.productsApiRemoteDataSource);

  Future<Either<Failure, List<Products>>> getProducts() async {
    try {
      return Right(await productsApiRemoteDataSource.getProducts());
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
