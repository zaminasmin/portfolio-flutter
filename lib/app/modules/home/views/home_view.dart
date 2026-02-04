import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background - can add mesh gradient or particles here later
          Column(
            children: [
              // Custom App Bar (Placeholder for now)
              Obx(
                () => Container(
                  height: 80,
                  color: controller.isscrolled.value
                      ? Theme.of(context).cardColor.withOpacity(0.9)
                      : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "< Portfolio />",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (Get.width > 800) // Desktop Menu
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => controller.scrollToSection(
                                controller.homeKey,
                              ),
                              child: const Text("Home"),
                            ),
                            TextButton(
                              onPressed: () => controller.scrollToSection(
                                controller.aboutKey,
                              ),
                              child: const Text("About"),
                            ),
                            TextButton(
                              onPressed: () => controller.scrollToSection(
                                controller.skillsKey,
                              ),
                              child: const Text("Skills"),
                            ),
                            TextButton(
                              onPressed: () => controller.scrollToSection(
                                controller.projectsKey,
                              ),
                              child: const Text("Projects"),
                            ),
                            const SizedBox(width: 30),
                          ],
                        )
                      else // Mobile Menu Icon
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                    ],
                  ),
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      HeroSection(key: controller.homeKey),
                      const SizedBox(height: 100),

                      AboutSection(key: controller.aboutKey),

                      ExperienceSection(),

                      SkillsSection(key: controller.skillsKey),

                      ProjectsSection(key: controller.projectsKey),

                      ContactSection(key: controller.contactKey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
