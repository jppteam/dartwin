import 'package:flutter/material.dart';

import 'package:dartwin/shared/widgets/dash.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class RowOfDashes extends StatefulWidget {
  final double x;
  final double y;

  const RowOfDashes({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  State<RowOfDashes> createState() => _RowOfDashesState();
}

class _RowOfDashesState extends State<RowOfDashes> {
  final Flutter3DController controller = Flutter3DController();
  final Flutter3DController controller2 = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 300,
            width: size.width / 4,
            child: Dash(
              controller: controller,
              key: const ValueKey('leftDash'),
              isLeft: true,
              dx: widget.x,
              dy: widget.y,
              screenSize: size,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 300,
            width: size.width / 4,
            child: Dash(
              controller: controller2,
              key: const ValueKey('rightDash'),
              dx: widget.x,
              dy: widget.y,
              screenSize: size,
            ),
          ),
        ),
      ],
    );
  }
}
