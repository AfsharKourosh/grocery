import 'package:flutter/material.dart';
import 'package:grocery/core/storage/app_storage.dart';
import 'package:grocery/feature/login/presentation/screen/login_screen.dart';
import 'package:grocery/feature/onBoarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingBottom extends StatelessWidget {
  final int currentPage;
  final int totalPage;
  final PageController pageController;
  const OnboardingBottom({
    super.key,
    required this.currentPage,
    required this.totalPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              // Dot indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  totalPage,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Next / Get Started button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPage < totalPage - 1) {
                      // go to next page
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      AppStorage.setOnboardingDone();
                      // last page → navigate
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => MyWidget()),
                      );
                    }
                  },
                  child: Text(
                    currentPage == totalPage - 1 ? 'Get Started' : 'Next',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
