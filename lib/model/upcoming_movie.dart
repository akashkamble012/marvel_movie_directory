// To parse this JSON data, do
//
//     final upcomingMovie = upcomingMovieFromMap(jsonString);

import 'dart:convert';

UpcomingMovie upcomingMovieFromMap(String str) =>
    UpcomingMovie.fromMap(json.decode(str));

String upcomingMovieToMap(UpcomingMovie data) => json.encode(data.toMap());

class UpcomingMovie {
  UpcomingMovie({
    required this.daysUntil,
    this.followingProduction,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.title,
    required this.type,
  });

  int daysUntil;
  UpcomingMovie? followingProduction;
  String overview;
  String posterUrl;
  DateTime releaseDate;
  String title;
  String type;

  UpcomingMovie copyWith({
    int? daysUntil,
    UpcomingMovie? followingProduction,
    String? overview,
    String? posterUrl,
    DateTime? releaseDate,
    String? title,
    String? type,
  }) =>
      UpcomingMovie(
        daysUntil: daysUntil ?? this.daysUntil,
        followingProduction: followingProduction ?? this.followingProduction,
        overview: overview ?? this.overview,
        posterUrl: posterUrl ?? this.posterUrl,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        type: type ?? this.type,
      );

  factory UpcomingMovie.fromMap(Map<String, dynamic> json) => UpcomingMovie(
        daysUntil: json["days_until"],
        followingProduction: json["following_production"] == null
            ? null
            : UpcomingMovie.fromMap(json["following_production"]),
        overview: json["overview"],
        posterUrl: json["poster_url"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "days_until": daysUntil == null ? null : daysUntil,
        "following_production":
            followingProduction == null ? null : followingProduction?.toMap(),
        "overview": overview == null ? null : overview,
        "poster_url": posterUrl == null ? null : posterUrl,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "type": type == null ? null : type,
      };
}
