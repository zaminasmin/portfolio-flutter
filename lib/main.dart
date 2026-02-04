import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/core/theme/app_theme.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/home/controllers/home_controller.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Register Controllers
  Get.put(HomeController());

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeView(),
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
    );
  }
}
