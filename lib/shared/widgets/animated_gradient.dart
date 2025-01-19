import 'package:flutter/material.dart';

class AnimatedGradient extends StatefulWidget {
  final Widget? child;
  final List<Color> colors;
  final List<Alignment> alignments;

  const AnimatedGradient({
    super.key,
    this.child,
    required this.colors,
    required this.alignments,
  });

  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            // animate the color
            bottomColor = widget.colors[index % widget.colors.length];
            topColor = widget.colors[(index + 1) % widget.colors.length];

            // animate the alignment
            begin = widget.alignments[index % widget.alignments.length];
            end = widget.alignments[(index + 2) % widget.alignments.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            bottomColor,
            topColor,
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
