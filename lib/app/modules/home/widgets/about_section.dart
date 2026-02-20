import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'particle_background.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(
        0xFF0F172A,
      ), // Slightly lighter background for contrast
      child: Stack(
        children: [
          const Positioned.fill(
            child: ParticleBackground(
              numberOfParticles: 100,
              particleColor: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
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
          ),
        ],
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
          "I am a Lead Flutter Developer with over 4 years of experience building production-grade ERP, logistics, and delivery applications. With a strong foundation in software engineering fundamentals, I have fully embraced the new paradigm of 'vibe coding' and AI-assisted engineering. \n\nBy leveraging advanced AI agents like Antigravity and Cursor, I am no longer limited by specific programming languages. If a project requires a new tech stack or language, I can rapidly adapt, write, and deploy it using these AI tools. This workflow has empowered me to architect and launch 4 new applications entirely through AI collaboration. \n\nWhether bridging complex hardware systems (RFID, IoT, POS) with mobile ecosystems or exploring uncharted technologies, I focus on delivering high-impact solutions. Based in the UAE and currently pursuing my MCA, I am an engineer driven by results and scalable architecture, not syntax.",
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
        _StatItem(label: "Experience", value: "4+ Yrs"),
        const SizedBox(width: 30),
        _StatItem(label: "Deployed", value: "10+ Apps"),
        const SizedBox(width: 30),
        _StatItem(label: "Vibe Coded Apps", value: "4"),
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
