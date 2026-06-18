import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_images.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppImages.dirinks)),
        Text('Title 1'),
        Text('Description 1'),
      ],
    );
  }
}
