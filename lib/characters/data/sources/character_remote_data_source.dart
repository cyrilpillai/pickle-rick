import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CharacterRemoteDataSource {
  final Dio _dio;

  CharacterRemoteDataSource(this._dio);

  Future<Response<dynamic>> fetchCharacters() async {
    return _dio.get('character/${generateNumbers(100)}');
  }

  String generateNumbers(int limit) {
    String numbers = List<int>.generate(limit, (index) => index + 1)
        .toString()
        .replaceAll(' ', '');
    return numbers.substring(1, numbers.length - 1);
  }
}
