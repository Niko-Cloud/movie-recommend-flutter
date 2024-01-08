import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recomendation/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recomendation/core/constant.dart';
import 'package:movie_recomendation/core/widgets/primary_button.dart';

class LandingScreen extends ConsumerWidget{
  const LandingScreen({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Let's find a movie",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset("images/thisone.png"),
            const Spacer(),
            PrimaryButton(
              onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: "Get Started"
            ),
            const SizedBox(height: kMediumSpacing)
          ],
        ),
      ),
    );
  }

}