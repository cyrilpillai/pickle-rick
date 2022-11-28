// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:dio_http_cache/dio_http_cache.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../characters/data/repositories/character_repository.dart' as _i8;
import '../characters/data/sources/character_local_data_source.dart' as _i6;
import '../characters/data/sources/character_remote_data_source.dart' as _i7;
import '../characters/domain/usecases/character_usecase.dart' as _i9;
import '../characters/presentation/bloc/character_list_bloc.dart' as _i10;
import 'network.dart' as _i11;
import 'persistence.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> init(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final persistenceModule = _$PersistenceModule();
  gh.lazySingleton<_i3.CacheConfig>(() => networkModule.cacheConfig());
  gh.lazySingleton<_i3.DioCacheManager>(
      () => networkModule.cacheManager(get<_i3.CacheConfig>()));
  gh.lazySingleton<_i4.Interceptor>(
      () => networkModule.interceptor(get<_i3.DioCacheManager>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => persistenceModule.preferences,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i6.CharacterLocalDataSource>(
      () => _i6.CharacterLocalDataSource(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio(
        get<String>(instanceName: 'BaseUrl'),
        get<_i4.Interceptor>(),
      ));
  gh.factory<_i7.CharacterRemoteDataSource>(
      () => _i7.CharacterRemoteDataSource(get<_i4.Dio>()));
  gh.factory<_i8.CharacterRepository>(() => _i8.CharacterRepository(
        get<_i6.CharacterLocalDataSource>(),
        get<_i7.CharacterRemoteDataSource>(),
      ));
  gh.factory<_i9.CharacterUseCase>(
      () => _i9.CharacterUseCase(get<_i8.CharacterRepository>()));
  gh.factory<_i10.CharacterListBloc>(
      () => _i10.CharacterListBloc(get<_i9.CharacterUseCase>()));
  return get;
}

class _$NetworkModule extends _i11.NetworkModule {}

class _$PersistenceModule extends _i12.PersistenceModule {}
