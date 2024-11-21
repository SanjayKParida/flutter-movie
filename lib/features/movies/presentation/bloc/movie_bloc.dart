import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_all_movies.dart';
import '../../domain/usecases/search_movies.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMoviesUseCase getAllMovies;
  final SearchMoviesUseCase searchMovies;

  MovieBloc({
    required this.getAllMovies,
    required this.searchMovies,
  }) : super(MovieInitialState()) {
    on<FetchAllMoviesEvent>(_onFetchAllMovies);
    on<SearchMoviesEvent>(_onSearchMovies);
    on<ClearMoviesEvent>(_onClearMovies);
  }

  void _onFetchAllMovies(
    FetchAllMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoadingState());
    try {
      final movies = await getAllMovies();
      emit(MovieLoadedState(movies));
    } catch (error) {
      emit(MovieErrorState(error.toString()));
    }
  }

  void _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoadingState());
    try {
      final movies = await searchMovies(event.query);
      emit(MovieLoadedState(movies));
    } catch (error) {
      emit(MovieErrorState(error.toString()));
    }
  }

  void _onClearMovies(
    ClearMoviesEvent event,
    Emitter<MovieState> emit,
  ) {
    emit(MovieInitialState());
  }
}
