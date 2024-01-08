import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recomendation/features/movie_flow/genre/genre_entity.dart';
import 'package:movie_recomendation/features/movie_flow/result/movie_entity.dart';

import '../../core/environment_variables.dart';
import '../../main.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getGenres();

  Future<List<MovieEntity>> getMovies(
      double rating, String date, String genreIds);
}

class TMDBMovieRepository implements MovieRepository {
  TMDBMovieRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<GenreEntity>> getGenres() async {
    final response = await dio.get("/genre/movie/list", queryParameters: {
      "api_key": "d9b0f2d4e1b3b2b2f0b2b2d9b0f2d4e1",
      "language": "en-US",
    });
    final results = List<Map<String, dynamic>>.from(response.data["genres"]);
    return results.map((e) => GenreEntity.fromMap(e)).toList();
  }

  @override
  Future<List<MovieEntity>> getMovies(
      double rating, String date, String genreIds) async {
    final response = await dio.get("discover/movie", queryParameters: {
      "api_key": api,
      "language": "en-US",
      "sort_by": "popularity.desc",
      "include_adult": false,
      "vote_average.gte": rating,
      "page": 1,
      "release_date.gte": date
    });
    final results = List<Map<String, dynamic>>.from(response.data["results"]);
    return results.map((e) => MovieEntity.fromMap(e)).toList();
  }
}
