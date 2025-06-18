import 'package:dio/dio.dart';

class MovieService {
  Dio dio = Dio();
  final header = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODVkNTdiM2ZmNDYwMjE3N2ZhMzkzYWYzMjQ0OWUyMSIsIm5iZiI6MTc0OTg5MzQ2OS4zNzQsInN1YiI6IjY4NGQ0MTVkNDNiNTAxMzA0NzVjNzdmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SK8LDX7KCpLZy1Ic0yuSZottHFenn0x_aNXLR1LFw0g",
    "accept": "application/json"
  };

  Future<List<dynamic>> popularMovies() async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1',
      options: Options(headers: header),
    );

    if (response.statusCode == 200) {
      print(response.data.toString());
      return response.data['results'];
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> upComingMovies() async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1',
      options: Options(headers: header),
    );

    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> topRatedMovies() async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1',
      options: Options(headers: header),
    );

    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> similarMovies(int movieId) async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US&page=1',
      options: Options(headers: header),
    );

    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Error');
    }
  }
}
