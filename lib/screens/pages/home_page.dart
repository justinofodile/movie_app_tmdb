import 'package:flutter/material.dart';
import 'package:the_app/screens/services/movie_service.dart';
import 'package:the_app/screens/widgets/horizontal_view_scroll.dart';
import 'package:the_app/screens/widgets/movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieService _movieService = MovieService();
  List<dynamic> popularMovies = [];
  List<dynamic> topRatedMovies = [];
  List<dynamic> upComingMovies = [];
  List<dynamic> filteredMovies = [];

  bool isSearchEmpty = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    popularMovies = await _movieService.popularMovies();
    upComingMovies = await _movieService.upComingMovies();
    topRatedMovies = await _movieService.topRatedMovies();
    setState(() {
      isLoading = false;
    });
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 1,
            // offset: const Offset(0, 2),
          )
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search Movies',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          searchBar(),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Top Rated Movies',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MovieSlider(topRatedMovies: topRatedMovies),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Popular Movies',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    HorizontalViewScroll(movies: popularMovies),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    HorizontalViewScroll(movies: upComingMovies),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
