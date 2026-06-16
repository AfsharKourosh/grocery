import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 48.0,
            vertical: 200.0,
          ),
          child: Center(
            child: Column(
              children: [
                 Expanded(
                   child: SizedBox(
                      width: 500.0,
                      height: 500.0,
                      child: Image.asset(AppImages.details),
                    ),
                 ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
