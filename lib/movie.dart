class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final double voteAverage;

  Movie(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterUrl: 'https://image.tmdb.org/t/p/w185/${json['poster_path']}',
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
