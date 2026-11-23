import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/my_plan/select_plan_screen.dart';
import 'package:fankosh/feature/my_plan/widgets/remaining_attempts_card.dart';
import 'package:flutter/material.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                          'تفاصيل الباقة',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.textDark,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'كل حاجة عن اشتراكك الحالي',
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

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    children: [
                      // Current Active Plan Header Card
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
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                                  Icon(Icons.circle, size: 6, color: ColorManager.badgeActiveGreenText),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'فانكوش بلس',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        color: ColorManager.textDark,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '40 محاولة • 30 يوم',
                                      style: TextStyle(
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
                      ),

                      const SizedBox(height: 16),

                      // Attempts Balance Card
                      const RemainingAttemptsCard(
                        remaining: 28,
                        total: 40,
                        showHeader: false,
                      ),

                      const SizedBox(height: 16),

                      // Details List Card
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ColorManager.borderLight),
                        ),
                        child: Column(
                          children: [
                            _buildDetailRow('تاريخ التفعيل', '15 أكتوبر 2026', Icons.calendar_today_outlined),
                            const Divider(height: 24, color: ColorManager.dividerColor),
                            _buildDetailRow('تاريخ الانتهاء', '14 نوفمبر 2026', Icons.access_time_rounded),
                            const Divider(height: 24, color: ColorManager.dividerColor),
                            _buildDetailRow('مدة الباقة', '30 يوم', Icons.hourglass_empty_rounded),
                            const Divider(height: 24, color: ColorManager.dividerColor),
                            _buildDetailRow('المبلغ المدفوع', '350 جنيه', Icons.receipt_long_outlined),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Bottom Button: Renew or Change Plan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: ColorManager.textDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectPlanScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh_rounded, size: 20, color: ColorManager.textDark),
                        SizedBox(width: 8),
                        Text(
                          'تجديد أو تغيير الباقة',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
            color: ColorManager.textDark,
          ),
        ),
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13.5,
                color: ColorManager.textMuted,
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, size: 18, color: ColorManager.textHint),
          ],
        ),
      ],
    );
  }
}
