// lib/features/movies/domain/usecases/search_movies.dart
import '../repositories/movie_repository.dart';
import '../../data/models/movie_model.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<List<MovieModel>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
