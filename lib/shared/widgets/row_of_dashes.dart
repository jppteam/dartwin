import 'package:flutter/material.dart';

import 'package:dartwin/shared/widgets/dash.dart';

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
