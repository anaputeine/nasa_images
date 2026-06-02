import 'package:nasa_images/api/nasa_api_client.dart';
import 'package:nasa_images/model/nasa_image.dart';
import 'package:nasa_images/repository/nasa_repository.dart';

class NetworkNasaRepository implements NasaRepository {
  final NasaApiClient _nasaApiClient;

  NetworkNasaRepository(this._nasaApiClient);

  @override
  Future<List<NasaImage>> getNasaImages(String? query) async {
    final nasaResponse = await _nasaApiClient.searchNasaImages(query);

    return nasaResponse.collection.items
        .map((item) => item.toNasaImage())
        .toList();
  }
}
