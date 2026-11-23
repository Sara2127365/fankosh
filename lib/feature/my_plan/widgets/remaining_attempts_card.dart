import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class RemainingAttemptsCard extends StatelessWidget {
  final int remaining;
  final int total;
  final bool showHeader;

  const RemainingAttemptsCard({
    super.key,
    required this.remaining,
    required this.total,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = total > 0 ? (remaining / total) : 0.0;
    final int percentInt = (percentage * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$percentInt% متبقي',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blueButton,
                ),
              ),
              Row(
                children: [
                  Text(
                    showHeader ? 'المحاولات المتبقية' : 'رصيد محاولاتك',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: ColorManager.textDark,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.bolt_rounded,
                    color: ColorManager.primaryColor,
                    size: 22,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Big Counter
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                ' محاولة',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
              Text(
                'من $total ',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
              Text(
                '$remaining ',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.blueButton,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 8,
              backgroundColor: ColorManager.borderColor,
              valueColor: const AlwaysStoppedAnimation<Color>(ColorManager.blueButton),
            ),
          ),

          const SizedBox(height: 12),

          // Note
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'استخدم محاولاتك قبل انتهاء الباقة.',
                style: TextStyle(
                  fontSize: 12,
                  color: ColorManager.textMuted,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.info_outline_rounded, size: 14, color: ColorManager.textMuted),
            ],
          ),
        ],
      ),
    );
  }
}
