// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NasaResponse _$NasaResponseFromJson(Map<String, dynamic> json) => NasaResponse(
  Collection.fromJson(json['collection'] as Map<String, dynamic>),
);

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
  (json['items'] as List<dynamic>)
      .map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  data: (json['data'] as List<dynamic>)
      .map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  links: (json['links'] as List<dynamic>)
      .map((e) => Link.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Data _$DataFromJson(Map<String, dynamic> json) =>
    Data(title: json['title'] as String, nasaId: json['nasa_id'] as String);

Link _$LinkFromJson(Map<String, dynamic> json) => Link(json['href'] as String);
