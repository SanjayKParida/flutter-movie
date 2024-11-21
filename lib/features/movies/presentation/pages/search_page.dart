// lib/features/movies/presentation/pages/search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import '../widgets/movie_card.dart';
import 'details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    resetSearchField();
  }

  void resetSearchField() {
    _searchController.clear();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
              hintText: 'Search movies...',
              filled: true,
              fillColor: AppTheme.darkGreyColor),
          onSubmitted: (query) {
            if (query.isNotEmpty) {
              context.read<MovieBloc>().add(SearchMoviesEvent(query));
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.search),
            onPressed: () {
              final query = _searchController.text;
              if (query.isNotEmpty) {
                context.read<MovieBloc>().add(SearchMoviesEvent(query));
              }
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieInitialState) {
            return const Center(
              child: Text('Enter a search term to find movies'),
            );
          }
          if (state is MovieLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieLoadedState) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text('No movies found'),
              );
            }
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(movie: movie),
                      ),
                    );
                  },
                  child: MovieCard(movie: movie),
                );
              },
            );
          }
          if (state is MovieErrorState) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
