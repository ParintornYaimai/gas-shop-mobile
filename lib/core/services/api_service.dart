import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl;
  final String jwtToken;
  late Dio _dio;

  ApiService({required this.baseUrl, required this.jwtToken}){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers:{
        'Content-Type':'application/json',
        'Authorization': 'Bearer $jwtToken'
      },
    ));

    _dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
    ));
  }

  Future<Map<String, dynamic>> get(String endpoint) async{
    try{
      final reponse = await _dio.get(endpoint);

      return reponse.data;
    } on DioException catch (e){
      throw Exception('GET request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<Map<String, dynamic>> post(String endpoint) async{
    try{
      final response = await _dio.post(endpoint);

      return response.data;
    }on DioException catch(e){
      throw Exception('POST request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<Map<String, dynamic>> put(String endpoint) async{
    try {
      final response = await _dio.put(endpoint);

      return response.data;
    } on DioException catch(e) {
      throw Exception('PUT request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<Map<String, dynamic>> patch(String endpoint) async{
    try {
      final response = await _dio.patch(endpoint);

      return response.data; 
    }on DioException catch(e){
      throw Exception('PATCH request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async{
    try {
      final response = await _dio.delete(endpoint);

      return response.data;
    }on DioException catch(e){
      throw Exception('DELETE request failed: ${e.response?.statusCode} ${e.message}');
    }
  }
}