import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class NeedMoreAttemptsBanner extends StatelessWidget {
  final VoidCallback onViewPlans;

  const NeedMoreAttemptsBanner({super.key, required this.onViewPlans});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD0E6FF)),
      ),
      child: Row(
        children: [
          // Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.blueButton,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onViewPlans,
            child: const Text(
              'شوف الباقات',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Spacer(),

          // Text Info
          const Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'محتاج محاولات أكثر؟',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'اكتشف باقي باقات فانكوش واختار الأنسب ليك',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: ColorManager.textMuted,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Bulb Icon
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: ColorManager.badgeYellowBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lightbulb_outline_rounded,
              color: ColorManager.amberDark,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
