// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NasaResponse _$NasaResponseFromJson(Map<String, dynamic> json) => NasaResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => NasaDataResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  links: (json['links'] as List<dynamic>)
      .map((e) => NasaLinkResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

NasaDataResponse _$NasaDataResponseFromJson(Map<String, dynamic> json) =>
    NasaDataResponse(
      nasaId: json['nasa_id'] as String,
      title: json['title'] as String,
    );

NasaLinkResponse _$NasaLinkResponseFromJson(Map<String, dynamic> json) =>
    NasaLinkResponse(href: json['href'] as String);
