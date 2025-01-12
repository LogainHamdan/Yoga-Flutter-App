import 'package:flutter/material.dart';

import '../core/util/constants.dart';

class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _sliderValue = 0.5; // Range is 0.0 to 1.0

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          // Update slider value based on vertical drag
          _sliderValue -= details.primaryDelta! / 300; // Adjust sensitivity
          _sliderValue = _sliderValue.clamp(0.0, 1.0);
        });
      },
      child: Container(
        width: 80,
        height: 300,
        child: CustomPaint(
          painter: SliderBackgroundPainter(sliderValue: _sliderValue),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: (1 - _sliderValue) * 280,
                child: CustomPaint(
                  size: const Size(20, 20), // Thumb size
                  painter: StreamlinedThumbPainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderBackgroundPainter extends CustomPainter {
  final double sliderValue;

  SliderBackgroundPainter({required this.sliderValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Creating gradient based on the slider's value, more colorful as the thumb approaches
    Paint linePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.purple.withOpacity(1.0), // Fully colored at the thumb position
          Colors.purple.withOpacity(0.2), // Faded color as it moves away
        ],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        stops: [
          sliderValue,
          sliderValue
        ], // Gradient stops at the thumb's position
      ).createShader(Rect.fromLTWH(size.width / 2 - 1, 0, 2, size.height));

    // Draw vertical line (slider track) with the gradient
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      linePaint,
    );

    // Draw nodes as half-circles (streamlined shape like the thumb)
    for (int i = 1; i <= 2; i++) {
      double dy = size.height * (i / 3); // Node positions
      double distance = (dy - sliderValue * size.height).abs();
      double intensity = (1 - (distance / (size.height / 2))).clamp(0.0, 1.0);

      // Ensure a minimum opacity for nodes so they aren't too faded
      double opacity = (0.3 + 0.7 * (1 - intensity))
          .clamp(0.3, 1.0); // Set a lower limit for opacity

      Paint nodePaint = Paint()..color = Colors.purple.withOpacity(opacity);

      Path nodePath = Path();

      // Create the half-circle for the node, just like the thumb shape
      nodePath.moveTo(
          size.width / 2 - size.width / 14, dy); // Starting point of the arc
      nodePath.arcTo(
        Rect.fromCircle(
          center: Offset(size.width / 2, dy), // Center of the arc
          radius: size.width / 14, // Radius of the arc (same size as the thumb)
        ),
        3.1416, // Starting angle (half-circle)
        3.1416, // Sweep angle (half-circle)
        false,
      );

      nodePath.close();

      canvas.drawPath(nodePath, nodePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class StreamlinedThumbPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint thumbPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.purple.withOpacity(0.7),
          Colors.purple,
          Colors.purple.withOpacity(0.5),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();

    // Draw half-circle shape for thumb
    path.moveTo(size.width / 2, 0); // Start at the top center
    path.arcTo(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height),
        radius: size.width / 2, // Radius for the thumb
      ),
      0,
      3.1416, // Half-circle arc
      false,
    );

    path.close();

    canvas.drawPath(path, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
