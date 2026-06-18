import 'package:flutter/material.dart';
import 'package:grocery/config/theme/app_colors.dart';
import 'package:grocery/core/storage/app_storage.dart';
import 'package:grocery/core/utils/app_images.dart';
import 'package:grocery/src/onBoarding/presentation/page/onboarding_screen.dart';
import 'package:grocery/src/permission/presentation/page/camera_permission_screen.dart';
import 'package:grocery/src/permission/presentation/page/microphone_permission_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    if (!AppStorage.cameraGranted) {
      // Camera not granted yet → show camera screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CameraPermissionScreen()),
      );
    } else if (!AppStorage.microphoneGranted) {
      // Camera done but mic not yet → show mic screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MicrophonePermissionScreen()),
      );
    } else {
      // Both granted → go to onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset(AppImages.logo))],
      ),
    );
  }
}
