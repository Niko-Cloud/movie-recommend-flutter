import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recomendation/features/movie_flow/movie_flow.dart';
import 'theme/custom_theme.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
  ));
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Recomendation',
      theme: CustomTheme.dark(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
