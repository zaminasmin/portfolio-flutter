import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends GetView<HomeController> {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Featured Projects",
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

          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: _getMockProjects()
                    .map((project) => _ProjectCard(project: project))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Temporary Mock Data until Firebase is connected
  List<ProjectModel> _getMockProjects() {
    return [
      // SISSCOL Infosolutions
      ProjectModel(
        id: '8',
        title: 'Paynback',
        description:
            'Fintech rewards wallet with QR payments and IoT Soundbox integration for real-time audio announcements.',
        imageUrl:
            'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Paynback',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'IoT', 'FinTech'],
      ),
      ProjectModel(
        id: '10',
        title: 'Relief',
        description:
            'Non-profit community platform for charitable outreach and secure donation collection via RESTful APIs.',
        imageUrl: 'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Relief',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'Charity', 'API'],
      ),

      // Sunrule Projects
      ProjectModel(
        id: '11',
        title: 'Tripix',
        description:
            'Logistics platform with multi-stop routing and Android overlay widget for instant order acceptance.',
        imageUrl: 'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Tripix',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'Maps', 'Overlay'],
      ),
      ProjectModel(
        id: '12',
        title: 'Educally',
        description:
            'Educational social ecosystem bridging institutions and the public with school discovery and management tools.',
        imageUrl:
            'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Educally',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'Education', 'Social'],
      ),
      ProjectModel(
        id: '13',
        title: 'Wedbell',
        description:
            'Three-tier event booking marketplace allowing organizers to showcase work and users to book appointments.',
        imageUrl: 'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Wedbell',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'Booking', 'Marketplace'],
      ),

      // Freelance Projects
      ProjectModel(
        id: '14',
        title: 'Kulue',
        description:
            'Logistics marketplace optimizing long-haul trucking by connecting manufacturers with drivers for return loads.',
        imageUrl: 'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Kulue',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'GetX', 'Firebase'],
      ),
      ProjectModel(
        id: '15',
        title: 'Bits Trade',
        description:
            'Van sales and billing app for mobile distributors with offline capabilities and thermal printing.',
        imageUrl:
            'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Bits+Trade',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'Offline', 'Thermal Print'],
      ),
      ProjectModel(
        id: '16',
        title: 'Habitrax',
        description:
            'Property maintenance tracking system for logging issues, setting reminders, and generating reports.',
        imageUrl:
            'https://placehold.co/600x400/1E293B/FFFFFF.png?text=Habitrax',
        link: 'mailto:zaminasmin111@gmail.com',
        techStack: ['Flutter', 'Maintenance', 'Tracking'],
      ),
    ];
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 350,
        transform: Matrix4.identity()..translate(0.0, isHovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                widget.project.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.techStack
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () async {
                        final Uri url = Uri.parse(widget.project.link);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      icon: const Icon(Icons.link),
                      label: const Text("View Project"),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
