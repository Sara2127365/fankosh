import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/auth/login/login_screen.dart';
import 'package:fankosh/feature/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:fankosh/feature/onboarding/widgets/onboarding_skip_button.dart';
import 'package:fankosh/feature/onboarding/widgets/onboarding_title_section.dart';
import 'package:flutter/material.dart';

class OnboardingSecondScreen extends StatelessWidget {
  const OnboardingSecondScreen({super.key});

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
                    'assets/images/onboarding_2.png',
                    height: size.height * 0.40,
                    fit: BoxFit.contain,
                  ),
                ),

                const Spacer(flex: 1),

                // Shared Title Section with Highlight
                const OnboardingTitleSection(
                  title: 'القفشة الحلوة تتشارك !',
                  subtitle: 'اسمع رد فانكوش وشارك تسجيلك و القفشة مع صحابك !',
                  highlightWidth: 170,
                ),

                const SizedBox(height: 24),

                // Shared Page Indicator
                const OnboardingPageIndicator(activeIndex: 1),

                const Spacer(flex: 1),

                // Shared Primary Button ("يلا نبدأ ←")
                AppPrimaryButton(
                  text: 'يلا نبدأ',
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
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
