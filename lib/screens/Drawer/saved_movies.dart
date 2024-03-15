import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app_example/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';

Future<dynamic> SavedMovies(BuildContext context) async {
  final double statusBarHeight = MediaQuery.of(context).padding.top;
  final double navigationBarHeight = MediaQuery.of(context).padding.bottom;
  final movies = Provider.of<List<Movie>>(context, listen: false);

  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    elevation: 0,
    backgroundColor: Colours.scaffoldBgColor,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: navigationBarHeight,
              left: 12.0,
              right: 12.0,
              top: statusBarHeight + 12.0,
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      return InkWell(
                        onTap: () {
                          print(movie);
                        },
                        child: ListTile(
                          title: Text(movie.title),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
