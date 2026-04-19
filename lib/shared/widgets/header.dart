import 'dart:async';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        SelectableText(
          '${DateTime.now().year} ЭТО ОЧЕРЕДНОЙ ГОД ДАРТ ПОБЕДЫ',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SelectableText.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Почему 2025 это очередной год дарт победы?',
            style: Theme.of(context).textTheme.bodySmall,
            children: const [
              TextSpan(text: '\n1. Дарт победа'),
              TextSpan(
                text:
                    '\n2. 🚀 Dart is blazingly fast and memory-efficient (man I love DartVM) 🚀',
              ),
              TextSpan(text: '\n3. Очередная дарт победа'),
              TextSpan(
                text:
                    '\n4. RenderBox was not laid out: RenderViewport#925a8 NEEDS-LAYOUT NEEDS-PAINT',
              ),
            ],
          ),
        ),
        const YearsText(),
      ],
    );
  }
}

class YearsText extends StatefulWidget {
  const YearsText({super.key});

  @override
  State<YearsText> createState() => _YearsTextState();
}

class _YearsTextState extends State<YearsText> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return SelectableText.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'ДАРТ ПОБЕДА УЖЕ',
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text:
                      ' ${(DateTime.now().difference(DateTime(2011, 10, 10)).inSeconds / 31536000).toStringAsFixed(8)} ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.red),
                ),
                const TextSpan(
                  text: 'ЛЕТ',
                ),
              ],
            ),
          );
        });
  }
}
