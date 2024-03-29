import 'package:flutter/material.dart';
import 'package:movie_recomendation/core/constant.dart';

class PrimaryButton extends StatelessWidget{
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
  });

  final VoidCallback onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius/2),
          ),
          fixedSize: Size(width, 48)
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge ,
            )
          ],
        ),
      ),
    );
  }
}