import 'package:flutter/material.dart';
import 'package:movie_recomendation/features/movie_flow/genre/genre_screen.dart';
import 'package:movie_recomendation/features/movie_flow/landing/landing_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({super.key});

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 600),
        curve: Curves.easeOutCubic);
  }

  void previousPage() {
    pageController.previousPage(
        duration: const Duration(microseconds: 600),
        curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children:[
        LandingScreen(nextPage: nextPage, previousPage: previousPage),
        GenreScreen(nextPage: nextPage, previousPage: previousPage),
        Scaffold(body: Container(color: Colors.blue)),
        Scaffold(body: Container(color: Colors.yellow)),
      ],
    );
  }
}
