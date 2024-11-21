
import '../../data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getAllMovies();
  Future<List<MovieModel>> searchMovies(String query);
}
