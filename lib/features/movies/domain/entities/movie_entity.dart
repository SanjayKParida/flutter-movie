import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String name;
  final String? summary;
  final String? imageUrl;
  final List<String>? genres;

  const MovieEntity({
    required this.id,
    required this.name,
    this.summary,
    this.imageUrl,
    this.genres,
  });

  @override
  List<Object?> get props => [id, name, summary, imageUrl, genres];
}
