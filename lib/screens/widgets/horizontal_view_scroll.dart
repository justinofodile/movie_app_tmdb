import 'package:flutter/material.dart';

class HorizontalViewScroll extends StatelessWidget {
  final List<dynamic> movies;
  const HorizontalViewScroll({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(movies.length, (index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200/${movie['poster_path']}',
                        width: 150,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        movie['title'],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
