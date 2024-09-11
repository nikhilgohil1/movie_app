class Movie {
  final String title;
  final String backdropPath;
  final String overview;
  final String posterPath;

  Movie(
      {required this.title,
      required this.backdropPath,
      required this.overview,
      required this.posterPath});

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        title: map['title'],
        backdropPath: map['backdrop_path'],
        overview: map['overview'],
        posterPath: map['poster_path']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backfropPath': backdropPath,
      'overview': overview,
      'posterPath': posterPath,
    };
  }
}
