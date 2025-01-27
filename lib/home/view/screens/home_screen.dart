import 'package:elevate_task/home/view_model/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:elevate_task/home/view/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProductsError) {
            return Center(child: Text(state.message));
          } else if (state is GetProductsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) =>
                    ProductCard(products: state.products[index]),
                itemCount: state.products.length,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      )),
    );
  }
}
