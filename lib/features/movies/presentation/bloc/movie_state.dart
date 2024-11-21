// lib/features/movies/presentation/bloc/movie_state.dart
import 'package:equatable/equatable.dart';
import '../../data/models/movie_model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<MovieModel> movies;

  const MovieLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieErrorState extends MovieState {
  final String message;

  const MovieErrorState(this.message);

  @override
  List<Object> get props => [message];
}
