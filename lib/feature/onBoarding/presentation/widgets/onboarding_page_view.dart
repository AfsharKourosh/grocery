import 'package:flutter/material.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/pages/onboarding_page1.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/pages/onboarding_page2.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/pages/onboarding_page3.dart';

class OnboardingPageView extends StatefulWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

   const OnboardingPageView({super.key, required this.onPageChanged, required this.pageController});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final List<Widget> pages = [
    OnboardingPage1(),
    OnboardingPage2(),
    OnboardingPage3(),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      onPageChanged: widget.onPageChanged,
      children: pages,
    );
  }
}
