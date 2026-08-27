import 'package:flutter/material.dart';
import 'package:grocery/core/assets/app_assets.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppImagesAsset.dirinks)),
        Text('Title 3'),
        Text('Description 3'),
      ],
    );
  }
}
