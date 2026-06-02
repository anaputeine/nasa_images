import 'package:dio/dio.dart';
import 'package:nasa_images/model/nasa_response.dart';

class NasaApiClient {
  final Dio _dio;

  NasaApiClient(this._dio);

  Future<NasaResponse> searchNasaImages(String? query) async {
    query ?? " ";
    final response = await _dio.get(
      '/search?q=$query&media_type=image&page_size=20',
    );
    return NasaResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
