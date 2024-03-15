import 'dart:convert';

class TVShow {
  final String name;
  final String backdropPath;
  final String originalName;
  final String overview;
  final String posterPath;
  final String firstAirDate;
  final double voteAverage;
  final int id;
  final List<int> genreIds;
  final List<String> originCountry;

  TVShow({
    required this.name,
    required this.backdropPath,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.id,
    required this.genreIds,
    required this.originCountry,
  });

  TVShow copyWith({
    String? name,
    String? backdropPath,
    String? originalName,
    String? overview,
    String? posterPath,
    String? firstAirDate,
    double? voteAverage,
    int? id,
    List<int>? genreIds,
    List<String>? originCountry,
  }) {
    return TVShow(
      name: name ?? this.name,
      backdropPath: backdropPath ?? this.backdropPath,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      voteAverage: voteAverage ?? this.voteAverage,
      id: id ?? this.id,
      genreIds: genreIds ?? this.genreIds,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  factory TVShow.fromMap(Map<String, dynamic> map) {
    return TVShow(
      name: map['name'],
      backdropPath: map['backdrop_path'] ?? '',
      originalName: map['original_name'],
      overview: map['overview'],
      posterPath: map['poster_path'] ?? '',
      firstAirDate: map['first_air_date'],
      voteAverage: map['vote_average'].toDouble(),
      id: map['id'],
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      originCountry: List<String>.from(map['origin_country'] ?? []),
    );
  }

  factory TVShow.fromJson(String source) => TVShow.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'backdrop_path': backdropPath,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'vote_average': voteAverage,
      'id': id,
      'genre_ids': genreIds,
      'origin_country': originCountry,
    };
  }

  @override
  String toString() {
    return 'TVShow(name: $name, backdropPath: $backdropPath, originalName: $originalName, overview: $overview, posterPath: $posterPath, firstAirDate: $firstAirDate, voteAverage: $voteAverage, id: $id, genreIds: $genreIds, originCountry: $originCountry)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TVShow &&
        other.name == name &&
        other.backdropPath == backdropPath &&
        other.originalName == originalName &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.firstAirDate == firstAirDate &&
        other.voteAverage == voteAverage &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        backdropPath.hashCode ^
        originalName.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        firstAirDate.hashCode ^
        voteAverage.hashCode ^
        id.hashCode ^
        genreIds.hashCode ^
        originCountry.hashCode;
  }
}
