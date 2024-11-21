import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/core/theme/app_theme.dart';
import 'package:http/http.dart' as http;
import 'features/movies/data/data_sources/remote_data_source.dart';
import 'features/movies/data/repositories/movie_repository_impl.dart';
import 'features/movies/domain/usecases/get_all_movies.dart';
import 'features/movies/domain/usecases/search_movies.dart';
import 'features/movies/presentation/bloc/movie_bloc.dart';
import 'features/movies/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(
            getAllMovies: GetAllMoviesUseCase(
              MovieRepositoryImpl(
                remoteDataSource: MovieRemoteDataSourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
            searchMovies: SearchMoviesUseCase(
              MovieRepositoryImpl(
                remoteDataSource: MovieRemoteDataSourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        theme: AppTheme.theme,
        home: const SplashPage(),
      ),
    );
  }
}
