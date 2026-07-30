import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/feature/onBoarding/presentation/bloc-cubit/cubit/on_bording_cubit.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_top.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_bottom.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit, OnBordingState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 48.0,
                vertical: 100.0,
              ),
              child: Column(
                children: [
                  OnboardingTop(),
                  Expanded(
                    child: OnboardingPageView(pageController: pageController),
                  ),
                  OnboardingBottom(
                    currentPage: state.currentIndex,
                    pageController: pageController,
                    totalPage: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
