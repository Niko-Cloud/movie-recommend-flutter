import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_recomendation/features/movie_flow/result/movie.dart';

import 'genre/genre.dart';

const movieMock = Movie(
  title: "Nyanpasu",
  overview:
      "Nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is nyanpasu is ",
  voteAverage: 1.1,
  genres: [Genre(name: "Comedy"), Genre(name: "Anime")],
  releaseDate: "2021-01-01",
  backdropPath: "",
  posterPath: "",
);

const genreMock = [
  Genre(name: "Anime"),
  Genre(name: "Action"),
  Genre(name: "Drama"),
  Genre(name: "Comedy"),
  Genre(name: "Ecchi"),
  Genre(name: "Horror"),
  Genre(name: "Romance"),
  Genre(name: "Thriller"),
  Genre(name: "Mystery"),
];

@immutable
class MovieFlowState extends Equatable {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.rating = 5,
    this.yearsBack = 5,
    this.genres = genreMock,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [
        pageController,
        rating,
        yearsBack,
        genres,
        movie,
      ];
}
