import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:fankosh/feature/plans/payment_method_screen.dart';
import 'package:fankosh/feature/plans/widgets/order_summary_card.dart';
import 'package:fankosh/feature/plans/widgets/plans_custom_app_bar.dart';
import 'package:fankosh/feature/plans/widgets/security_card.dart';
import 'package:flutter/material.dart';

class PlanReviewScreen extends StatelessWidget {
  final PlanModel plan;

  const PlanReviewScreen({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Shared App Bar
                const PlansCustomAppBar(),

                const SizedBox(height: 12),

                // Confirmation Badge ("🎫 تأكيد الاشتراك")
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.badgeYellowBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '🎫 تأكيد الاشتراك',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.amberDark,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Title
                const Text(
                  'راجع باقتك! 🎬',
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
                  'خطوة واحدة وتكمّل رحلة الإفيهات.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorManager.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 22),

                // Selected Plan Detail Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: plan.isPopular
                          ? ColorManager.primaryColor
                          : ColorManager.borderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Top Row: Change Plan Link & Badge Space
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Change plan link on right in RTL
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        size: 16,
                                        color: ColorManager.blueLink,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'تغيير الباقة',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.blueLink,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 100),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Plan Title & Price Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  plan.title,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.textDark,
                                  ),
                                ),
                                Text(
                                  '${plan.price} جنيه',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: ColorManager.goldAmber,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              'الاشتراك الشهري المميز',
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorManager.textMuted,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Plan Features Container
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: ColorManager.cardBackgroundAlt,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.mic_none_outlined,
                                        size: 18,
                                        color: ColorManager.amberIcon,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${plan.attempts} محاولة صوتية للتعرف على الإفيه',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.textCharcoal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 16,
                                        color: ColorManager.amberIcon,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'صالحة لمدة 30 يومًا',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.textCharcoal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Popular Ribbon Badge
                      if (plan.topBadge != null)
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: const BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                  color: ColorManager.textDark,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  plan.topBadge!,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Order Summary Card
                OrderSummaryCard(plan: plan),

                const SizedBox(height: 16),

                // Security Guarantee Card
                const SecurityGuaranteeCard(),

                const SizedBox(height: 24),

                // Checkout Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: ColorManager.textDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentMethodScreen(plan: plan),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle_outline_rounded,
                          size: 20,
                          color: ColorManager.textDark,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'متابعة للدفع - ${plan.price} جنيه',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'سيتم تفعيل باقتك بعد تأكيد الدفع بنجاح.',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 12,
                    color: ColorManager.textAfterButton,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
