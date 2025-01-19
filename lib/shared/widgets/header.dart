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
          '2025 ЭТО ОЧЕРЕДНОЙ ГОД ДАРТ ПОБЕДЫ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SelectableText.rich(
          TextSpan(
            text: 'Почему 2025 это очередной год дарт победы?',
            style: Theme.of(context).textTheme.bodyMedium,
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
      ],
    );
  }
}
