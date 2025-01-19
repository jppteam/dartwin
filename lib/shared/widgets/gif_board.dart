import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';

class GifBoard extends StatelessWidget {
  const GifBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            AvifImage.asset(
              'assets/f1.avifs',
              height: 200,
            ),
            AvifImage.asset(
              'assets/f2.avifs',
              height: 200,
            ),
          ],
        ),
        AvifImage.asset('assets/pr.avif'),
      ],
    );
  }
}
