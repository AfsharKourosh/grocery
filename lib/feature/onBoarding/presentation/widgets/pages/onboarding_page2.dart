import 'package:flutter/material.dart';
import 'package:grocery/core/assets/app_assets.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppImagesAsset.fruits)),
        Text('Title 2'),
        Text('Description 2'),
      ],
    );
  }
}
