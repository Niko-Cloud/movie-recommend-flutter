import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recomendation/core/constant.dart';
import 'package:movie_recomendation/core/widgets/primary_button.dart';
import 'package:movie_recomendation/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recomendation/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(children: [
          Text(
            "How many years back should we check for?",
            style: theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "${ref.watch(movieFlowControllerProvider).yearsBack}",
              style: theme.textTheme.displayLarge?.copyWith(
                color: theme.textTheme.displayLarge?.color?.withOpacity(0.9),
              ),
            ),
            Text(
              "Years back",
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.textTheme.displayMedium?.color?.withOpacity(0.7),
              ),
            ),
          ]),
          const Spacer(),
          Slider(
              value: ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateYearsBack(value.toInt());
              },
              min: 0,
              max: 70,
              divisions: 70,
              label: "${ ref.watch(movieFlowControllerProvider).yearsBack.toDouble()}"),
          const Spacer(),
          PrimaryButton(
            onPressed: () => Navigator.of(context).push(ResultScreen.route()),
            text: "Continue",
          ),
          const SizedBox(height: kMediumSpacing,)
        ]),
      ),
    );
  }
}
