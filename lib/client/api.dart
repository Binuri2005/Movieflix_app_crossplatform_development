// Importing necessary libraries and files
import "dart:convert";

import "package:movie_app_example/constants/constants.dart";
import "package:movie_app_example/models/movie.dart";
import 'package:http/http.dart' as http;

// Class responsible for handling API requests
class ApiService {
  // URL for fetching highest-grossing movies
  static const highestgrossingsUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&sort_by=revenue.desc";

  // URL for fetching kids movies
  static const kidsMoviesUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&certification_country=US&certification.lte=G&sort_by=popularity.desc&with_genres=16";

  // URL for fetching trending movies
  static const trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";

  // URL for fetching top rated movies
  static const topUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";

  //https://api.themoviedb.org/3/movie/upcoming
  static const upComingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  // URL for searching movies
  static const searchUrl =
      "https://api.themoviedb.org/3/search/movie?query=boss&include_adult=true&language=en-US&page=1&api_key=${Constants.apiKey}";

  // Method to fetch kids movies
  Future<List<Movie>> getKidsMovies() async {
    final reponse = await http.get(Uri.parse(kidsMoviesUrl));
    if (reponse.statusCode == 200) {
      final detectData = json.decode(reponse.body)['results'] as List;
      return detectData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Error');
    }
  }

  // Method to fetch highest-grossing movies
  Future<List<Movie>> highestGrossing() async {
    final reponse = await http.get(Uri.parse(highestgrossingsUrl));
    if (reponse.statusCode == 200) {
      final detectData = json.decode(reponse.body)['results'] as List;
      return detectData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Error');
    }
  }

  // Method to fetch trending movies
  Future<List<Movie>> getTrendingMovie() async {
    final reponse = await http.get(Uri.parse(trendingUrl));
    if (reponse.statusCode == 200) {
      final detectData = json.decode(reponse.body)['results'] as List;
      return detectData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Error');
    }
  }

  // Method to fetch top rated movies
  Future<List<Movie>> getTopMovie() async {
    final reponse = await http.get(Uri.parse(topUrl));
    if (reponse.statusCode == 200) {
      final detectData = json.decode(reponse.body)['results'] as List;
      return detectData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Error');
    }
  }

  // Method to fetch upcoming movies
  Future<List<Movie>> getUpcomingMovie() async {
    final reponse = await http.get(Uri.parse(upComingUrl));
    if (reponse.statusCode == 200) {
      final detectData = json.decode(reponse.body)['results'] as List;
      return detectData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Error');
    }
  }

  // Method to search movies based on a query
  Future<List<Movie>> getSearchMovie(String query) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=$query&include_adult=true&language=en-US&page=1&api_key=${Constants.apiKey}"));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something error');
    }
  }
}
