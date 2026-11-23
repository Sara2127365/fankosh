import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class SubscriptionBannerCard extends StatelessWidget {
  final String planTitle;
  final int remainingAttempts;
  final VoidCallback onViewPlan;

  const SubscriptionBannerCard({
    super.key,
    required this.planTitle,
    required this.remainingAttempts,
    required this.onViewPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title with Medal Icon (Right in RTL)
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.military_tech_rounded,
                      color: ColorManager.textDark,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'اشتراكي: $planTitle',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textDark,
                    ),
                  ),
                ],
              ),

              // Active Badge (Left in RTL)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorManager.badgeActiveGreenBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: ColorManager.badgeActiveGreenText,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'نشطة',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.badgeActiveGreenText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: ColorManager.dividerColor),
          const SizedBox(height: 10),

          // Attempts and Link
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Attempts remaining (Right in RTL)
              Text(
                '$remainingAttempts محاولة متبقية هذا الشهر',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.textDark,
                ),
              ),

              // View Plan Link (Left in RTL)
              GestureDetector(
                onTap: onViewPlan,
                child: const Row(
                  children: [
                    Text(
                      'عرض باقتي',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.blueLink,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: ColorManager.blueLink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
