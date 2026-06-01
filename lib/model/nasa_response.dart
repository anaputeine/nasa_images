import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'nasa_image.dart';

part 'nasa_response.g.dart';

@JsonSerializable(createToJson: false)
class NasaResponse extends Equatable {
  final List<NasaDataResponse> data;
  final List<NasaLinkResponse> links;

  const NasaResponse({required this.data, required this.links});

  factory NasaResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaResponseFromJson(json);

  NasaImage toNasaImage() {
    return NasaImage(
      id: data.first.nasaId,
      name: data.first.title,
      imageUrl: links.first.href,
    );
  }

  @override
  List<Object?> get props => [data, links];
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class NasaDataResponse extends Equatable {
  final String nasaId;
  final String title;

  const NasaDataResponse({required this.nasaId, required this.title});

  factory NasaDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaDataResponseFromJson(json);

  @override
  List<Object?> get props => [nasaId, title];
}

@JsonSerializable(createToJson: false)
class NasaLinkResponse extends Equatable {
  final String href;

  const NasaLinkResponse({required this.href});

  factory NasaLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaLinkResponseFromJson(json);

  @override
  List<Object?> get props => [href];
}
