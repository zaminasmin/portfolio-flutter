import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(0xFF0F172A),
      child: Column(
        children: [
          Text(
            "Experience",
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

          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                _ExperienceItem(
                  role: "Flutter Developer Lead",
                  company: "BEAMS IT Solutions",
                  period: "April 2024 – Present",
                  location: "Dubai, UAE",
                  description:
                      "Leading the Beams Enterprise ERP Ecosystem. Architected and built 7+ core modules:\n"
                      "• Wallop ecosystem: Amusement Park ERP with RFID 'Tap-to-Play' & Booking Engine.\n"
                      "• Beams Gas: Utility platform with Sunmi integration & offline logistics.\n"
                      "• Beams Mobility: C-Suite Executive Dashboards with real-time analytics.\n"
                      "• Beams ESS: Biometric clock-in & HR management for 500+ staff.\n"
                      "• Beams Trade: Warehouse automation via PDA/Barcode scanners.\n"
                      "• Beams Bistro: Full-service Restaurant POS with KOT & Split Payments.\n"
                      "• Price Check: Instant retail inventory lookup tool.\n\n"
                      "Tech: Flutter, GetX, Sunmi, RFID, Offline-First, WebSocket.",
                  isFirst: true,
                ),
                _ExperienceItem(
                  role: "Senior Flutter Developer",
                  company: "SISSCOL INFO SOLUTIONS",
                  period: "July 2023 – January 2024",
                  location: "Kochi, India",
                  description:
                      "Spearheaded key FinTech and Marketplace solutions:\n"
                      "• Smart Labour: Designed a hybrid marketplace for skilled labor bidding and property hunting (Rent/Sale).\n"
                      "• Paynback: Developed a digital rewards wallet with QR payments and IoT Soundbox integration for audio alerts.\n"
                      "• Relief: Built a non-profit donation platform with secure payment gateways.",
                ),
                _ExperienceItem(
                  role: "Flutter Developer",
                  company: "Sunrule Digital Solutions",
                  period: "Nov 2022 – Aug 2023",
                  location: "Bangalore, India",
                  description:
                      "Built Tripix (logistics), Educally (school management), and Wedbell (event booking).",
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final String location;
  final String description;
  final bool isFirst;
  final bool isLast;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line
          SizedBox(
            width: 50,
            child: Column(
              children: [
                if (!isFirst)
                  Expanded(child: Container(width: 2, color: Colors.white24)),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
                if (!isLast)
                  Expanded(child: Container(width: 2, color: Colors.white24)),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        company,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "•  $location",
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    period,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX();
  }
}
