// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:elevate_task/home/data/data_source/product_api_data_source.dart'
    as _i686;
import 'package:elevate_task/home/data/repositories/products_repositories.dart'
    as _i586;
import 'package:elevate_task/home/view_model/cubit/products_cubit.dart'
    as _i904;
import 'package:elevate_task/shared/di/register_module.dart' as _i1042;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i686.ProductsApiRemoteDataSource>(
        () => _i686.ProductsApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i586.ProductsRepositories>(() =>
        _i586.ProductsRepositories(gh<_i686.ProductsApiRemoteDataSource>()));
    gh.singleton<_i904.ProductsCubit>(
        () => _i904.ProductsCubit(gh<_i586.ProductsRepositories>()));
    return this;
  }
}

class _$RegisterModule extends _i1042.RegisterModule {}
