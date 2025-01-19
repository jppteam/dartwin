import 'package:dartwin/shared/glitch.dart';
import 'package:dartwin/shared/widgets/animated_gradient.dart';
import 'package:dartwin/shared/overflow_indicator.dart';
import 'package:dartwin/shared/widgets/gif_board.dart';
import 'package:dartwin/shared/widgets/header.dart';
import 'package:dartwin/shared/widgets/row_of_dashes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 40,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double x = 0.0;
  double y = 0.0;

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updateLocation,
      child: Scaffold(
        body: AnimatedGradient(
          colors: const [
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.yellow,
          ],
          alignments: const [
            Alignment.bottomLeft,
            Alignment.bottomRight,
            Alignment.topRight,
            Alignment.topLeft,
          ],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: <Widget>[
                const SizedBox(height: 20),
                const GlitchEffect(child: Header()),
                const Spacer(),
                RowOfDashes(x: x, y: y),
                const Spacer(),
                const GifBoard(),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomOverflowIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
