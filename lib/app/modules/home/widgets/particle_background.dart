import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  final int numberOfParticles;
  final Color particleColor;
  final double speed;

  const ParticleBackground({
    super.key,
    this.numberOfParticles = 500,
    this.particleColor = const Color(0xFF3B82F6), // Blue-ish
    this.speed = 1.0,
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Point3D> _points;
  Offset _mousePosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _points = _generateSpherePoints(widget.numberOfParticles);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<_Point3D> _generateSpherePoints(int count) {
    // Fibonacci sphere algorithm for even distribution
    final points = <_Point3D>[];
    final double phi = pi * (3 - sqrt(5)); // Golden angle

    for (int i = 0; i < count; i++) {
      final double y = 1 - (i / (count - 1)) * 2; // y goes from 1 to -1
      final double radius = sqrt(1 - y * y); // Radius at y

      final double theta = phi * i; // Golden angle increment

      final double x = cos(theta) * radius;
      final double z = sin(theta) * radius;

      points.add(_Point3D(x, y, z));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.localPosition;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size.infinite,
            painter: _ParticlePainter(
              points: _points,
              rotation: _controller.value * 2 * pi,
              color: widget.particleColor,
              mousePosition: _mousePosition,
            ),
          );
        },
      ),
    );
  }
}

class _Point3D {
  double x, y, z;
  _Point3D(this.x, this.y, this.z);
}

class _ParticlePainter extends CustomPainter {
  final List<_Point3D> points;
  final double rotation;
  final Color color;
  final Offset mousePosition;

  _ParticlePainter({
    required this.points,
    required this.rotation,
    required this.color,
    required this.mousePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final minDimension = min(size.width, size.height);
    final radius = minDimension * 0.8; // Sphere radius relative to screen
    final paint = Paint()..style = PaintingStyle.fill;

    // Calculate mouse interaction
    // Normalize mouse position (-1 to 1)
    double mouseX = 0;
    double mouseY = 0;
    if (mousePosition != Offset.zero) {
      mouseX = (mousePosition.dx - centerX) / centerX; // -1 to 1
      mouseY = (mousePosition.dy - centerY) / centerY; // -1 to 1
    }

    // Apply dampened mouse rotation
    // Invert X for natural feeling (move mouse right -> rotate right)
    // Invert Y for tilt
    double targetRotationY = rotation + mouseX * 0.5;
    double targetTiltX = 0.2 + mouseY * 0.5;

    for (var point in points) {
      // Rotate around Y axis (Auto rotation + Mouse influence)
      double rotY = targetRotationY;
      double x = point.x * cos(rotY) - point.z * sin(rotY);
      double z = point.x * sin(rotY) + point.z * cos(rotY);
      double y = point.y;

      // Rotate around X axis (Tilt + Mouse influence)
      double tilt = targetTiltX;
      double yRot = y * cos(tilt) - z * sin(tilt);
      double zRot = y * sin(tilt) + z * cos(tilt);

      y = yRot;
      z = zRot;

      // Project 3D to 2D
      // Simple orthographic-ish projection for the sphere effect,
      // but perspective makes it look more 3D.
      // Perspective factor:
      double fov = 1000;
      double scale = fov / (fov + z * radius);
      // Actually standard projection: x2d = x * radius * scale
      // Let's just do simple x * radius for now, z affects size/alpha.

      double x2d = centerX + x * radius * scale * 0.5; // Scale down a bit
      double y2d = centerY + y * radius * scale * 0.5;

      // Depth cues
      // Z ranges from approx -1 to 1.
      double alpha = ((z + 1) / 2).clamp(0.1, 1.0); // 0.1 to 1.0 opacity
      double sizePoint = 1.5 + (z + 1) * 1.5; // Size based on depth

      paint.color = color.withOpacity(alpha * 0.6); // Base opacity 0.6

      canvas.drawCircle(Offset(x2d, y2d), sizePoint, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
