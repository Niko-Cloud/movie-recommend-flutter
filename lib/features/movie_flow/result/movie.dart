import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../genre/genre.dart';
import 'movie_entity.dart';

@immutable
class Movie extends Equatable {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  factory Movie.fromEntity(MovieEntity entity, List<Genre> genres) {
    return Movie(
      title: entity.title,
      overview: entity.overview,
      voteAverage: entity.voteAverage,
      genres: genres.where((genre) => entity.genreIds.contains(genre.id)).toList(),
      releaseDate: entity.releaseDate,
      backdropPath: "https://image.tmdb.org/t/p/original/${entity.backdropPath}",
      posterPath:  "https://image.tmdb.org/t/p/original/${entity.posterPath}",
    );
  }

  Movie.initial()
      : this(
          title: "",
          overview: "",
          voteAverage: 0,
          genres: [],
          releaseDate: "",
          backdropPath: "",
          posterPath: "",
        );

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(", ");

  @override
  String toString() {
    return "Movie(title: $title, overview: $overview, voteAverage: $voteAverage, genres: $genres, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath)";
  }

  @override
  List<Object?> get props => [
        title,
        overview,
        voteAverage,
        genres,
        releaseDate,
        backdropPath,
        posterPath,
      ];
}
