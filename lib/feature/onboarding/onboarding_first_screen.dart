import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/onboarding/onboarding_second_screen.dart';
import 'package:fankosh/feature/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:fankosh/feature/onboarding/widgets/onboarding_skip_button.dart';
import 'package:fankosh/feature/onboarding/widgets/onboarding_title_section.dart';
import 'package:flutter/material.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAF5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                // Shared Top Skip Button
                const OnboardingSkipButton(),

                const Spacer(flex: 1),

                // Illustration
                Center(
                  child: Image.asset(
                    'assets/images/onboarding_1.png',
                    height: size.height * 0.40,
                    fit: BoxFit.contain,
                  ),
                ),

                const Spacer(flex: 1),

                // Shared Title Section with Highlight
                const OnboardingTitleSection(
                  title: 'قول اللي في بالك!',
                  subtitle: 'قول أي كلام، وفانكوش هيرد عليك بإفيه جامد!',
                  highlightWidth: 140,
                ),

                const SizedBox(height: 24),

                // Shared Page Indicator
                const OnboardingPageIndicator(activeIndex: 0),

                const Spacer(flex: 1),

                // Shared Primary Button ("التالي ←")
                AppPrimaryButton(
                  text: 'التالي',
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingSecondScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
