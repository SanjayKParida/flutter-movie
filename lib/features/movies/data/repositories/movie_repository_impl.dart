import '../../domain/repositories/movie_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MovieModel>> getAllMovies() async {
    try {
      // Fetch movies from the remote data source
      final List<MovieModel> movieModels =
          await remoteDataSource.getAllMovies();

      // Optionally, you could transform or log data here
      return movieModels;
    } catch (e) {
      throw Exception('Failed to fetch all movies: $e');
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      // Search for movies using the remote data source
      final List<MovieModel> movieModels =
          await remoteDataSource.searchMovies(query);

      // Optionally, you could transform or log data here
      return movieModels;
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }
}
