import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive Layout Decision
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 40 : 100,
          ),
          child: isMobile
              ? Column(
                  children: [
                    const _ProfileImageStack(),
                    const SizedBox(height: 40),
                    const _HeroTextContent(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: _HeroTextContent()),
                    const SizedBox(width: 40),
                    const Expanded(child: _ProfileImageStack()),
                  ],
                ),
        );
      },
    );
  }
}

class _HeroTextContent extends StatelessWidget {
  const _HeroTextContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello, I am",
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(),

        const SizedBox(height: 10),

        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "MUHAMMED ZAMIN ASMIN />",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              height: 1.1,
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(),

        const SizedBox(height: 10),

        Text(
          "Full Stack Flutter Developer",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: Colors.white70),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Resume",
                style: TextStyle(color: Colors.white),
              ),
            ).animate().scale(delay: 600.ms),

            const SizedBox(width: 20),

            OutlinedButton(
              onPressed: () {
                try {
                  Get.find<HomeController>().scrollToSection(
                    Get.find<HomeController>().contactKey,
                  );
                } catch (e) {
                  debugPrint("Controller not found");
                }
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Contact Me"),
            ).animate().scale(delay: 700.ms),
          ],
        ),
      ],
    );
  }
}

class _ProfileImageStack extends StatelessWidget {
  const _ProfileImageStack();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow/Circle
          Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      blurRadius: 50,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
                duration: 3000.ms,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),

          // Profile Image
          Container(
            height: 350,
            width: 350,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter, // Often better for portraits
              ),
            ),
          ).animate().fadeIn(duration: 1000.ms).scale(),

          // Orbiting Icons (Mockups)
          // React
          Positioned(
                right: 0,
                bottom: 100,
                child: _TechIcon(icon: Icons.code, color: Colors.blue),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .moveY(
                begin: 0,
                end: 20,
                duration: 2000.ms,
                curve: Curves.easeInOut,
              ),

          // Flutter
          Positioned(
                left: 0,
                top: 100,
                child: _TechIcon(
                  icon: Icons.flutter_dash,
                  color: Colors.blueAccent,
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .moveY(
                begin: 0,
                end: -20,
                duration: 2000.ms,
                curve: Curves.easeInOut,
                delay: 500.ms,
              ),

          // Firebase
          Positioned(
                right: 50,
                top: 50,
                child: _TechIcon(
                  icon: Icons.local_fire_department,
                  color: Colors.orange,
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .moveX(
                begin: 0,
                end: 15,
                duration: 2500.ms,
                curve: Curves.easeInOut,
                delay: 1000.ms,
              ),
        ],
      ),
    );
  }
}

class _TechIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _TechIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Custom Surface
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 32),
    );
  }
}
