import 'package:flutter/material.dart';
import 'package:the_app/screens/services/movie_service.dart';
import 'package:the_app/screens/widgets/filtered_movie_list.dart';
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

  bool isSearchEmpty = false;
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

  void filterMovies(String query) {
    setState(() {
      filteredMovies = popularMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          upComingMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          topRatedMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList();
      if (query.isEmpty) {
        isSearchEmpty = true;
      } else {
        isSearchEmpty = false;
      }
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
      child: TextField(
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {
              isSearchEmpty = false;
              filteredMovies = [];
            });
          } else {
            filterMovies(value);
          }
        },
        decoration: const InputDecoration(
          hintText: 'Search Movies',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              searchBar(),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : filteredMovies.isNotEmpty
                      ? Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Searched Movies',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            FilteredMovieList(movies: filteredMovies)
                          ],
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
        ),
      ),
    );
  }
}
