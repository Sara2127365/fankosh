import 'dart:ui';
import 'package:fankosh/core/localization/app_localization.dart';
import 'package:flutter/material.dart';

class FankoshBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FankoshBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.78),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.95),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Tab 0: الرئيسية (Appears on the Right in RTL)
                _buildNavItem(
                  index: 0,
                  label: context.tr.home,
                  icon: Icons.home_outlined,
                  inactiveIcon: Icons.home_outlined,
                ),

                // Tab 1: الباقات (Center)
                _buildNavItem(
                  index: 1,
                  label: context.tr.plans,
                  icon: Icons.bolt_outlined,
                  inactiveIcon: Icons.bolt_outlined,
                ),

                // Tab 2: حسابي (Appears on the Left in RTL)
                _buildNavItem(
                  index: 2,
                  label: context.tr.account,
                  icon: Icons.person_outline_rounded,
                  inactiveIcon: Icons.person_outline_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    required IconData icon,
    required IconData inactiveIcon,
  }) {
    final bool isSelected = currentIndex == index;

    if (isSelected) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF7BD1E),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF7BD1E).withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              inactiveIcon,
              size: 24,
              color: const Color(0xFF6E7480),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6E7480),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
