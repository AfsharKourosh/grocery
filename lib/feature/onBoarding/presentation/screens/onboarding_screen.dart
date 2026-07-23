import 'package:flutter/material.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_top.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_bottom.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 48.0,
            vertical: 200.0,
          ),
          child: Column(
            children: [
              OnboardingTop(),

              Expanded(
                child: OnboardingPageView(
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  pageController: _pageController,
                ),
              ),

              OnboardingBottom(
                currentPage: _currentPage,
                pageController: _pageController,
                totalPage: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
