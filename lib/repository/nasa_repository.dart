import 'package:nasa_images/model/nasa_image.dart';

abstract class NasaRepository {
  Future<List<NasaImage>> getNasaImages(String? query);
}
