// Importing necessary libraries and files
import 'dart:convert';

import 'package:movie_app_example/constants/constants.dart';
import 'package:movie_app_example/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_example/models/video_movie.dart';

// Class responsible for handling video API requests
class ApiVideo {
  // URL for fetching video data from the API
  static const videoApiUrl =
      "https://api.themoviedb.org/3/movie/866398/videos?api_key=${Constants.apiKey}";

  // Method to retrieve video data for a given movie
  Future<VideoMovie> getVideo(Movie movie) async {
    print(movie.id);
    // Fetching video data from the API
    final reponse = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${movie.id}/videos?api_key=${Constants.apiKey}"));

    // Checking if the response status code is successful
    if (reponse.statusCode == 200) {
      final List<dynamic> results = json.decode(reponse.body)['results'];

      // Checking if there are more than one results
      if (results.length > 1) {
        final Map<String, dynamic> secondResult = results[1];
        return VideoMovie.fromJson(secondResult);
      } else {
        throw Exception('Second result not found');
      }
    } else {
      throw Exception('Something Error');
    }
  }
}
