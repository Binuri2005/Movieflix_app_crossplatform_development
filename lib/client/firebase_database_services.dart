import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_example/models/movie.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference moviecollection =
      FirebaseFirestore.instance.collection("saved_movies");

  Future<void> updateSavedMovies(Movie movie) async {
    try {
      await moviecollection.doc(uid).set({
        'title': movie.title,
        'backDropPath': movie.backDropPath,
        'originalTitle': movie.originalTitle,
        'overview': movie.overview,
        'posterPath': movie.posterPath,
        'realseDate': movie.realseDate,
        'voteAverage': movie.voteAverage
      });
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Stream<List<Movie>> get movies {
    return moviecollection.snapshots().map(_movieListFromSnapshot);
  }

  List<Movie> _movieListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return Movie(
        title: data['title'] ?? '',
        backDropPath: data['backDropPath'] ?? '',
        originalTitle: data['originalTitle'] ?? '',
        overview: data['overview'] ?? '',
        posterPath: data['posterPath'] ?? '',
        realseDate: data['releaseDate'] ?? '',
        voteAverage: data['voteAverage'] ?? 0.0,
        id: 0,
      );
    }).toList();
  }

  Stream<List<Movie>> get moviesFromDoc {
    return moviecollection.doc(uid).snapshots().map((m) {
      if (m.exists) {
        List<Movie> movies = [];
        Map<String, dynamic> data = m.data() as Map<String, dynamic>;
        if (data.containsKey('movies')) {
          List<dynamic> moviesData = data['movies'];
          for (var movieData in moviesData) {
            movies.add(
              Movie(
                title: movieData['title'] ?? '',
                backDropPath: movieData['backDropPath'] ?? '',
                originalTitle: movieData['originalTitle'] ?? '',
                overview: movieData['overview'] ?? '',
                realseDate: movieData['releaseDate'] ?? '',
                voteAverage: movieData['voteAverage'] ?? 0.0,
                id: 0,
                posterPath: movieData['posterPath'] ?? '',
              ),
            );
          }
        }
        return movies;
      } else {
        return [];
      }
    });
  }
}
