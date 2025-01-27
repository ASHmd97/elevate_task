import 'package:elevate_task/home/view/screens/home_screen.dart';
import 'package:elevate_task/home/view_model/cubit/products_cubit.dart';
import 'package:elevate_task/shared/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(BlocProvider(
    create: (context) => GetIt.instance<ProductsCubit>()..getProducts(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {HomeScreen.routeName: (_) => const HomeScreen()},
      initialRoute: HomeScreen.routeName,
    );
  }
}
