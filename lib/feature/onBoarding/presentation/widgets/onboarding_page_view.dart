import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/feature/onBoarding/presentation/bloc-cubit/cubit/on_bording_cubit.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/pages/onboarding_page1.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/pages/onboarding_page2.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/pages/onboarding_page3.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final List<Widget> pages = const [
    OnboardingPage1(),
    OnboardingPage2(),
    OnboardingPage3(),
  ];
  const OnboardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        context.read<OnBordingCubit>().changePage(index);
      },
      children: pages,
    );
  }
}
