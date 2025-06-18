import 'package:dio/dio.dart';

class MovieService {
  Dio dio = Dio();

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
