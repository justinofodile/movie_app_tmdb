import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<dynamic> topRatedMovies;
  const MovieSlider({super.key, required this.topRatedMovies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: topRatedMovies.length,
      itemBuilder: (context, index, realIndex) {
        final movies = topRatedMovies[index];
        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${movies['backdrop_path']}',
                    // width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              child: Text(
                movies['title'],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        );
      },
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: true,
        pageSnapping: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
