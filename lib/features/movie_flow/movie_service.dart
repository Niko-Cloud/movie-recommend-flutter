import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recomendation/features/movie_flow/movie_repository.dart';
import 'package:movie_recomendation/features/movie_flow/result/movie.dart';

import 'genre/genre.dart';

final movieServiceProvider = Provider<MovieService>((ref){
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMDBMovieService(movieRepository);
});

abstract class MovieService {
  Future<List<Genre>> getGenres();

  Future<Movie> getMovies(
      int rating, int yearsBack, List<Genre> genres, [DateTime? yearsBackFromDate]);
}

class TMDBMovieService implements MovieService{
  TMDBMovieService(this._movieRepository);
  final MovieRepository _movieRepository;

  @override
  Future<List<Genre>> getGenres() async {
    final genreEntities = await _movieRepository.getGenres();
    return genreEntities.map((e) => Genre.fromEntity(e)).toList();
  }

  @override
  Future<Movie> getMovies(int rating, int yearsBack, List<Genre> genres, [DateTime? yearsBackFromDate]) async {
    final date = yearsBackFromDate ?? DateTime.now();
    final year = date.year - yearsBack;
    final genreIds = genres.map((e) => e.id).toList().join(",");
    final movieEntities = await _movieRepository.getMovies(rating.toDouble(), "$year-01-01", genreIds);
    final movies = movieEntities.map((e) => Movie.fromEntity(e,genres)).toList();

    final rand = Random();
    final randomMovie = movies[rand.nextInt(movies.length)];
    return randomMovie;
  }
}