import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(0xFF0B1120), // Dark background
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: GoogleFonts.spaceGrotesk(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Have a project in mind or want to collaborate? Feel free to connect.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.envelope,
                url: 'mailto:zaminasmin111@gmail.com',
                color: Colors.redAccent,
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: FontAwesomeIcons.phone,
                url: 'tel:+971561327377',
                color: Colors.green,
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: FontAwesomeIcons.linkedin,
                url:
                    'https://linkedin.com/in/zamin-asmin', // Placeholder as not in resume
                color: Colors.blue[700]!,
              ),
            ],
          ),
          const SizedBox(height: 80),
          Text(
            "© 2026 MUHAMMED ZAMIN ASMIN. All rights reserved.",
            style: GoogleFonts.inter(fontSize: 12, color: Colors.white24),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color color;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (!await launchUrl(uri)) {
          // Handle error
        }
      },
      icon: FaIcon(icon, size: 30),
      style: IconButton.styleFrom(
        foregroundColor: color,
        backgroundColor: Colors.white.withOpacity(0.05),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
