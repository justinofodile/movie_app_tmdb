import 'package:flutter/material.dart';
import 'package:the_app/screens/services/movie_service.dart';
import 'package:the_app/screens/widgets/horizontal_view_scroll.dart';

class MovieDetails extends StatefulWidget {
  final dynamic movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<dynamic> similarMovies = [];
  bool _isLoading = true;

  @override
  void initState() {
    getSimilarMovies();
    super.initState();
  }

  getSimilarMovies() async {
    MovieService movieService = MovieService();
    similarMovies = await movieService.similarMovies(widget.movie['id']);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${widget.movie['backdrop_path']}',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Title: ${widget.movie['title']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Overview: ${widget.movie['overview']}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Language: ${widget.movie['original_language'].toString().toUpperCase()}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Popularity: ${widget.movie['popularity'].toString()}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Release Date: ${widget.movie['release_date']}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Vote average: ${widget.movie['vote_average'].toString()}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Similar Movies',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : HorizontalViewScroll(movies: similarMovies),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
