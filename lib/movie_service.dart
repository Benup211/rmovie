import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';

class MovieService {
  static Future<List<Movie>> getPopularMovies() async {
    final String apiKey = 'cdeccc5144fe0b30f688e830cd884ed3';
    final String baseUrl = 'https://api.themoviedb.org/3';
    final String endpoint = '/movie/popular';

    final response =
        await http.get(Uri.parse('$baseUrl$endpoint?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<Movie> movies = [];

      for (var movieJson in json['results']) {
        final movie = Movie.fromJson(movieJson);
        movies.add(movie);
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
