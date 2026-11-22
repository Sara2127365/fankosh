import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int activeIndex;
  final int totalCount;

  const OnboardingPageIndicator({
    super.key,
    required this.activeIndex,
    this.totalCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCount, (index) {
        final isActive = index == activeIndex;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF299BF5) : const Color(0xFFD6DFE8),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
