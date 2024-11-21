
import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.name,
    super.summary,
    super.imageUrl,
    super.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['show']['id'],
      name: json['show']['name'],
      summary: json['show']['summary']?.replaceAll(RegExp(r'<[^>]*>'), ''),
      imageUrl: json['show']['image']?['medium'],
      genres: List<String>.from(json['show']['genres'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'summary': summary,
        'imageUrl': imageUrl,
        'genres': genres,
      };
}
