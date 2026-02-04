import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'name': 'Flutter & Dart',
        'icon': Icons.flutter_dash,
        'color': Colors.blue,
      },
      {
        'name': 'Clean Arch / MVVM',
        'icon': Icons.architecture,
        'color': Colors.tealAccent,
      },
      {
        'name': 'CI/CD & DevOps',
        'icon': Icons.cloud_sync,
        'color': Colors.blueGrey,
      },
      {
        'name': 'TDD / Testing',
        'icon': Icons.bug_report,
        'color': Colors.greenAccent,
      },
      {
        'name': 'Hardware (RFID/OCR)',
        'icon': Icons.memory,
        'color': Colors.redAccent,
      },
      {
        'name': 'GetX & Provider',
        'icon': Icons.data_array,
        'color': Colors.purple,
      },
      {
        'name': 'Firebase',
        'icon': Icons.local_fire_department,
        'color': Colors.orange,
      },
      {'name': 'REST API / SQL', 'icon': Icons.api, 'color': Colors.indigo},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            "My Skills",
            style: GoogleFonts.spaceGrotesk(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn().slideY(begin: 0.5, end: 0),

          const SizedBox(height: 10),
          Container(
            height: 4,
            width: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 60),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: skills
                .map(
                  (skill) => _SkillCard(
                    name: skill['name'] as String,
                    icon: skill['icon'] as IconData,
                    color: skill['color'] as Color,
                  ),
                )
                .toList()
                .animate(interval: 100.ms)
                .fadeIn()
                .scale(),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color color;

  const _SkillCard({
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withOpacity(isHovered ? 0.8 : 0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered ? widget.color : Colors.white10,
            width: 2,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 48,
              color: isHovered ? widget.color : Colors.white70,
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
