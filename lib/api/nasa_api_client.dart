import 'package:dio/dio.dart';
import 'package:nasa_images/model/nasa_response.dart';

class NasaApiClient {
  final Dio _dio;

  NasaApiClient(this._dio);

  Future<List<NasaResponse>> searchNasaImages(String? query) async {
    query ?? " ";
    final response = await _dio.get('/search?q=$query');
    final json = response.data as List<dynamic>;
    final nasaImages = json.map((image) => NasaResponse.fromJson(image));
    return nasaImages.toList();
  }
}
