import 'package:flutter/material.dart';
import 'package:grocery/core/assets/app_assets.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppImagesAsset.details)),
        Text('Title 1'),
        Text('Description 1'),
      ],
    );
  }
}
