import 'package:dartwin/shared/no_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Dash extends StatefulWidget {
  final double dx;
  final double dy;
  final Size screenSize;
  final bool? isLeft;

  const Dash({
    super.key,
    required this.dx,
    required this.dy,
    required this.screenSize,
    this.isLeft = false,
  });

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final Flutter3DController controller = Flutter3DController();

  @override
  void initState() {
    super.initState();

    controller.onModelLoaded.addListener(() async {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
      controller.setCameraOrbit(20, 70, 100);

      final animations = await controller.getAvailableAnimations();

      controller.playAnimation(animationName: animations.first);
    });
  }

  @override
  void didUpdateWidget(covariant Dash oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!mounted) return;

    if (oldWidget.dx != widget.dx || oldWidget.dy != widget.dy) {
      final quarterWidth = widget.screenSize.width / 4;
      final threeQuartersWidth = widget.screenSize.width * 0.75;
      final x = widget.dx;

      final quarter = widget.isLeft! ? quarterWidth : threeQuartersWidth;

      double theta;

      if (x <= quarter) {
        theta = 90 - (x / quarter * 90);
      } else {
        theta = ((quarter - x) / (widget.screenSize.width - quarter)) * 90;
      }

      final normalizedY = widget.dy / widget.screenSize.height;
      final phi = 180 - (normalizedY * 180);

      controller.setCameraOrbit(theta, phi, 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: Flutter3DViewer(
        enableTouch: false,
        src: 'assets/flutter_dash.glb',
        controller: controller,
        progressBarColor: Colors.transparent,
      ),
    );
  }
}
