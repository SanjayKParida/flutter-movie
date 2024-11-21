import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import '../widgets/movie_card.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isMoviesFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isMoviesFetched) {
      context.read<MovieBloc>().add(FetchAllMoviesEvent());
      _isMoviesFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MovieLoadedState) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                'assets/vectors/app_logo_wbg.png',
                width: MediaQuery.of(context).size.width * 0.48,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Recently Added",
                      style: GoogleFonts.dmSans(fontSize: 18)),
                ),
                Expanded(
                  child: ListView.builder(
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
                  ),
                ),
              ],
            ),
          );
        }
        if (state is MovieErrorState) {
          return Center(
            child: Text(
              'Error: ${state.message}',
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
          );
        }
        return const Center(
          child: Text(
            'No movies found.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        );
      },
    );
  }
}
