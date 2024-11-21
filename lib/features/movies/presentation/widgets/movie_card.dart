import 'package:flutter/material.dart';
import 'package:flutter_movie/core/theme/app_theme.dart';
import '../../data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkGreyColor, // Dark grey background for the card
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          Container(
            width: MediaQuery.sizeOf(context).width * 0.32,
            height: MediaQuery.sizeOf(context).width * 0.45,
            decoration: BoxDecoration(
              image: movie.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(movie.imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: movie.imageUrl == null ? AppTheme.greyColor : null,
              borderRadius: BorderRadius.circular(
                  12), // Rounded corners for the image container
            ),
            child: movie.imageUrl == null
                ? const Center(child: Icon(Icons.movie, color: Colors.white))
                : null,
          ),

          // Movie Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color:
                              AppTheme.primaryColor, // Title in primary color
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.summary ?? 'No summary available',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  if (movie.genres != null && movie.genres!.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: movie.genres!
                          .take(3)
                          .map((genre) => Chip(
                                backgroundColor: AppTheme.primaryColor,
                                label: Text(
                                  genre,
                                  style: const TextStyle(
                                    color:
                                        Colors.white, // Genres in primary color
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(
                                        style: BorderStyle.none)),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                              ))
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
