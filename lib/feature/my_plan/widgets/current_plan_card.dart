import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class CurrentPlanCard extends StatelessWidget {
  final String title;
  final int attempts;
  final int days;
  final String priceText;
  final String expiryDate;

  const CurrentPlanCard({
    super.key,
    required this.title,
    required this.attempts,
    required this.days,
    required this.priceText,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
              // Badge "الباقة الحالية"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorManager.badgeYellowBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'الباقة الحالية',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.amberDark,
                  ),
                ),
              ),

              // Title and Medal
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: ColorManager.textDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$attempts محاولة • $days يوم',
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorManager.textMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.military_tech_rounded,
                      color: ColorManager.textDark,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 2 Sub-Cards: Expiry & Amount Paid
          Row(
            children: [
              // Expiry Date Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: ColorManager.cardBackgroundLight,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'تاريخ الانتهاء',
                        style: TextStyle(
                          fontSize: 11,
                          color: ColorManager.textMuted,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            expiryDate,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textDark,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.calendar_today_outlined, size: 13, color: ColorManager.amberIcon),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Amount Paid Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: ColorManager.cardBackgroundLight,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'المبلغ المدفوع',
                        style: TextStyle(
                          fontSize: 11,
                          color: ColorManager.textMuted,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            priceText,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textDark,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.receipt_long_outlined, size: 14, color: ColorManager.amberIcon),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
