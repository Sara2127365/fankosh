import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:fankosh/feature/plans/plan_review_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({super.key});

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  int _selectedPlanIndex = 1; // 1 = Plus (350 جنيه)

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Custom Top App Bar (Bell, Logo, Profile)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        color: ColorManager.textDark,
                        size: 26,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                    Image.asset(
                      AppAssets.fankoshLogo,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.textDark,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          color: ColorManager.textDark,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Title Section with Back Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorManager.borderLight),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: ColorManager.textDark,
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          'اختار باقتك',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.textDark,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'كمّل قفشاتك مع الباقة اللي تناسبك',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: ColorManager.textMuted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 44),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Current Plan Banner Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ColorManager.borderLight),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.badgeActiveGreenBg,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'نشطة',
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.badgeActiveGreenText,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: ColorManager.badgeActiveGreenText,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'باقتك الحالية',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        color: ColorManager.textMuted,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'فانكوش بلس',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: ColorManager.textDark,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '28 محاولة متبقية • تنتهي 15 نوفمبر',
                                      style: TextStyle(
                                        fontSize: 11.5,
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
                      ),

                      const SizedBox(height: 22),

                      // Section Title
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'الباقات المتاحة',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Option 1: Lite (199 جنيه)
                      _buildPlanOption(
                        index: 0,
                        title: 'فانكوش لايت',
                        attemptsText: '20 محاولة • 30 يوم',
                        priceText: '199 جنيه',
                        periodText: 'شهرياً',
                      ),

                      const SizedBox(height: 12),

                      // Option 2: Plus (350 جنيه)
                      _buildPlanOption(
                        index: 1,
                        title: 'فانكوش بلس',
                        attemptsText: '40 محاولة • 30 يوم',
                        priceText: '350 جنيه',
                        periodText: '',
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Checkout Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: ColorManager.textDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      final chosenPlan = _selectedPlanIndex == 1
                          ? PlanModel.samplePlans[2] // Plus 350
                          : PlanModel.samplePlans[1]; // Lite 199/290
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlanReviewScreen(plan: chosenPlan),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'متابعة للدفع',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_back_rounded, size: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // Security footer note
              const Padding(
                padding: EdgeInsets.only(bottom: 16, top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'دفع إلكتروني آمن ومشفّر 100%',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: ColorManager.textMuted,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.lock_outline_rounded,
                      size: 14,
                      color: ColorManager.textMuted,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption({
    required int index,
    required String title,
    required String attemptsText,
    required String priceText,
    required String periodText,
  }) {
    final isSelected = _selectedPlanIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPlanIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: ColorManager.cardBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? ColorManager.primaryColor
                : ColorManager.borderLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priceText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: isSelected
                        ? ColorManager.goldAmber
                        : ColorManager.textDark,
                  ),
                ),
                if (periodText.isNotEmpty)
                  Text(
                    periodText,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: ColorManager.textMuted,
                    ),
                  ),
              ],
            ),

            // Right: Radio + Title & Attempts
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      attemptsText,
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorManager.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected
                      ? ColorManager.primaryColor
                      : ColorManager.borderColor,
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
