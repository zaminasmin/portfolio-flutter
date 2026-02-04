import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final RxBool isscrolled = false.obs;

  // Navigation Keys for scrolling to sections
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        isscrolled.value = true;
      } else {
        isscrolled.value = false;
      }
    });
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
