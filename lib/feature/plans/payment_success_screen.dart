import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/home/home_screen.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:fankosh/feature/plans/widgets/plans_custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final PlanModel plan;

  const PaymentSuccessScreen({super.key, required this.plan});

  Widget _buildDetailRow({
    required String label,
    required String value,
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: ColorManager.textMuted),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.bold,
              color: isHighlight
                  ? ColorManager.goldAmber
                  : ColorManager.textDark,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Shared App Bar
                      const PlansCustomAppBar(),

                      const SizedBox(height: 12),

                      // Jumping Celebrate Character Illustration
                      Center(
                        child: SizedBox(
                          height: 190,
                          child: Image.asset(
                            AppAssets.celebrateCharacter,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: ColorManager.primaryLight,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.celebration_rounded,
                                  color: ColorManager.primaryColor,
                                  size: 64,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Heading
                      const Text(
                        'عاش يا نجم! 🎉',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Subtitle
                      const Text(
                        'الدفع تم بنجاح، وباقتك اتفعّلت. جاهز نكمّل؟',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorManager.textMuted,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Subscription Details Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ColorManager.borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'تفاصيل اشتراكك',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textDark,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Divider(
                              color: ColorManager.dividerColor,
                              height: 1,
                            ),
                            const SizedBox(height: 8),

                            _buildDetailRow(label: 'الباقة', value: plan.title),
                            const Divider(
                              color: ColorManager.dividerColor,
                              height: 1,
                            ),

                            _buildDetailRow(
                              label: 'المحاولات',
                              value: '${plan.attempts} محاولة',
                            ),
                            const Divider(
                              color: ColorManager.dividerColor,
                              height: 1,
                            ),

                            _buildDetailRow(label: 'المدة', value: '30 يوم'),
                            const Divider(
                              color: ColorManager.dividerColor,
                              height: 1,
                            ),

                            _buildDetailRow(
                              label: 'المبلغ المدفوع',
                              value: '${plan.price} جنيه',
                              isHighlight: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Primary CTA: يلا نكمّل قفشات!
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primaryColor,
                            foregroundColor: ColorManager.textDark,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'يلا نكمّل قفشات!',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Secondary Link: عرض اشتراكي
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlansScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'عرض اشتراكي',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textAfterButton,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
