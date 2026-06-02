import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'nasa_image.dart';

part 'nasa_response.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class NasaResponse extends Equatable {
  final Collection collection;

  const NasaResponse(this.collection);

  factory NasaResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaResponseFromJson(json);

  @override
  List<Object?> get props => [collection];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Collection extends Equatable {
  final List<Item> items;

  const Collection(this.items);

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  @override
  List<Object?> get props => [items];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Item extends Equatable {
  final List<Data> data;
  final List<Link> links;

  const Item({required this.data, required this.links});

  NasaImage toNasaImage() {
    final metadata = data.first;

    return NasaImage(
      id: metadata.nasaId,
      name: metadata.title,
      imageUrl: links.first.href,
    );
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  List<Object?> get props => [data, links];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Data extends Equatable {
  final String title;
  @JsonKey(name: 'nasa_id')
  final String nasaId;

  const Data({required this.title, required this.nasaId});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  List<Object?> get props => [title];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Link extends Equatable {
  final String href;

  const Link(this.href);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  @override
  List<Object?> get props => [href];
}
