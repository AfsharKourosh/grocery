import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_constants.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppImages.fruits)),
        Text('Title 1'),
        Text('Description 1'),
      ],
    );
  }
}
