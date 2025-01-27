part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class GetProductsLoading extends ProductsState {}

class GetProductsError extends ProductsState {
  final String message;
  GetProductsError(this.message);
}

class GetProductsSuccess extends ProductsState {
  final List<Products> products;
  GetProductsSuccess(this.products);
}
