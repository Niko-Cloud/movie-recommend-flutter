import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recomendation/core/constant.dart';
import 'package:movie_recomendation/core/widgets/primary_button.dart';
import 'package:movie_recomendation/features/movie_flow/genre/genre.dart';
import 'package:movie_recomendation/features/movie_flow/movie_flow_controller.dart';

import 'movie.dart';

class ResultScreen extends ConsumerWidget {
  static route({bool fullscreenDialog = true}) =>
      MaterialPageRoute(builder: (context) => const ResultScreen());

  const ResultScreen({super.key});

  final double movieHeight = 150;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CoverImage(),
                  Positioned(
                    child: MovieImageDetails(
                      movie: ref.watch(movieFlowControllerProvider).movie,
                      movieHeight: movieHeight,
                    ),
                    width: MediaQuery.of(context).size.width,
                    bottom: -(movieHeight / 2),
                  )
                ],
              ),
              SizedBox(height: movieHeight / 2),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  ref.watch(movieFlowControllerProvider).movie.overview,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              )
            ]),
          ),
          PrimaryButton(
            onPressed: () => Navigator.of(context).pop(),
            text: "Find another movie",
          ),
          const SizedBox(
            height: kMediumSpacing,
          )
        ],
      ),
    );
  }
}

class MovieImageDetails extends ConsumerWidget {
  const MovieImageDetails(
      {super.key, required this.movie, required this.movieHeight});

  final double movieHeight;
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(),
          ),
          const SizedBox(
            width: kMediumSpacing,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  movie.title,
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  movie.genresCommaSeparated,
                  style: theme.textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text(movie.voteAverage.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color
                              ?.withOpacity(0.7),
                        )),
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 18,
                    )
                  ],
                )
              ]))
        ],
      ),
    );
  }
}

class CoverImage extends ConsumerWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints.expand(height: 300),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.transparent,
          ], begin: Alignment.center, end: Alignment.bottomCenter)
              .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}
