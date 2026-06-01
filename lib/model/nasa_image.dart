import 'package:equatable/equatable.dart';

class NasaImage extends Equatable {
  final String id;
  final String name;
  final String imageUrl;

  const NasaImage({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl];
}
