import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CharacterRemoteDataSource {
  final Dio _dio;

  CharacterRemoteDataSource(this._dio);

  Future<Response<dynamic>> fetchCharacters() async {
    return _dio.get('character');
  }
}
