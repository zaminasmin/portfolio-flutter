import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(
        0xFF0F172A,
      ), // Slightly lighter background for contrast
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: isMobile
                  ? Column(children: _buildContent(context))
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildContent(context, isRow: true),
                    ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context, {bool isRow = false}) {
    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: GoogleFonts.spaceGrotesk(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ).animate().fadeIn().slideX(),

        const SizedBox(height: 20),

        Text(
          "I am a Lead Flutter Developer with over 4 years of experience building production-grade ERP, logistics, and delivery applications. I specialize in architecting scalable systems using MVVM and Clean Architecture, and I have a proven track record of taking end-to-end ownership of the entire Software Development Lifecycle (SDLC). \n\nMy expertise includes integrating complex hardware like RFID, OCR, and thermal printers into mobile ecosystems. Currently, I am expanding my skillset into DevOps, leveraging my hands-on experience with CI/CD pipelines, TDD, and automated deployment to bridge the gap between mobile engineering and cloud infrastructure. Based in the UAE and currently pursuing an MCA, I am a growth-oriented engineer dedicated to building high-quality, automated, and user-centric software.",
          style: GoogleFonts.inter(
            fontSize: 16, // Slightly smaller to fit more text
            height: 1.6,
            color: Colors.white70,
          ),
        ).animate().fadeIn(delay: 200.ms),

        const SizedBox(height: 20),

        _buildStatRow(context),
      ],
    );

    final imageContent = Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/profile.png'),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).scale();

    if (isRow) {
      return [
        Expanded(child: imageContent),
        const SizedBox(width: 60),
        Expanded(child: textContent),
      ];
    } else {
      return [imageContent, const SizedBox(height: 40), textContent];
    }
  }

  Widget _buildStatRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _StatItem(label: "Years Experience", value: "4+"),
        const SizedBox(width: 30),
        _StatItem(label: "Production Apps", value: "10+"),
        const SizedBox(width: 30),
        _StatItem(label: "Domains", value: "5+"),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 14, color: Colors.white54),
        ),
      ],
    );
  }
}
