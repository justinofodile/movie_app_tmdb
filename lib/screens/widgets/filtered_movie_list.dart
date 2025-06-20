import 'package:flutter/material.dart';
import 'package:the_app/screens/pages/movie_details.dart';

class FilteredMovieList extends StatelessWidget {
  final List<dynamic> movies;
  const FilteredMovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(movie: movie),
                ),
              );
            },
            leading: Image.network(
              'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
              width: 50,
              height: 100,
              fit: BoxFit.cover,
            ),
            title: Text(movie['title']),
            subtitle: Text(movie['overview']),
          );
        });
  }
}
