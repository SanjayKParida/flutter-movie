import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/movie_model.dart';

class DetailsPage extends StatelessWidget {
  final MovieModel movie;

  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.darkGreyColor,
                    ),
                    child: const Icon(
                      IconlyLight.arrow_left_2,
                      color: AppTheme.primaryColor,
                    ))),
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: movie.imageUrl != null
                  ? Image.network(
                      movie.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.movie, size: 100),
                        );
                      },
                    )
                  : Container(
                      color: AppTheme.darkGreyColor,
                      child: const Icon(Icons.movie, size: 100),
                    ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: GoogleFonts.dmSans(
                          color: AppTheme.primaryColor,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    if (movie.genres != null && movie.genres!.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        children: movie.genres!
                            .map((genre) => Chip(
                                  label: Text(genre),
                                  backgroundColor: AppTheme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          style: BorderStyle.none)),
                                ))
                            .toList(),
                      ),
                    const SizedBox(height: 16),
                    Text(
                      'Summary',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.summary ?? 'No summary available',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
