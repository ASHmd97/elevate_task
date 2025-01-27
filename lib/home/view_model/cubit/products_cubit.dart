import 'package:elevate_task/home/data/models/products.dart';
import 'package:elevate_task/home/data/repositories/products_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'products_state.dart';

@singleton
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepositories) : super(ProductsInitial());

  final ProductsRepositories productsRepositories;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await productsRepositories.getProducts();
    result.fold(
      (failure) => emit(GetProductsError(failure.message)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }
}
