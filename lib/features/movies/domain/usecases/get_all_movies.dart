// lib/features/movies/domain/usecases/get_all_movies.dart
import '../repositories/movie_repository.dart';
import '../../data/models/movie_model.dart';

class GetAllMoviesUseCase {
  final MovieRepository repository;

  GetAllMoviesUseCase(this.repository);

  Future<List<MovieModel>> call() async {
    return await repository.getAllMovies();
  }
}

