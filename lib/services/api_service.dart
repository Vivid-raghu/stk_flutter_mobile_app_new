// api_service.dart
import 'package:dio/dio.dart';
import '../config/config.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
    BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
    ),
  );

  Future<Response> loginPost(String endpoint, Map<String, dynamic> data) async {

    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
