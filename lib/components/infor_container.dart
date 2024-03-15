import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_example/models/movie.dart';
import 'package:provider/provider.dart';

import '../client/firebase_database_services.dart';

// InforContainer widget definition
class InforContainer extends StatelessWidget {
  const InforContainer({
    super.key,
    required this.movie,
  });

  final Movie movie;

// Method to save movie to database
  void _saveMovieToDatabase(User user, Movie movie) async {
    print(user);
    print(movie);
    DatabaseService(uid: user.uid).updateSavedMovies(movie);
  }

  // Build method to create the widget
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Text('Release date: ',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(movie.realseDate,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14, fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        Text('Rating: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text('${movie.voteAverage.toStringAsFixed(1)}/10',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _saveMovieToDatabase(user!, movie);
                    },
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.red,
                          onPressed: () {
                            _saveMovieToDatabase(user!, movie);
                          },
                        ),
                        const Text(
                          'Add to Favorites',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
