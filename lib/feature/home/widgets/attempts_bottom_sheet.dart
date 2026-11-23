import 'package:fankosh/core/services/attempts_manager.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';

void showAttemptsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => const AttemptsBottomSheet(),
  );
}

class AttemptsBottomSheet extends StatelessWidget {
  const AttemptsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 14,
                bottom: 30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top Drag Handle
                  Center(
                    child: Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                        color: ColorManager.borderAlt,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Glowing Energy / Lightning Coin in Center
                  Center(
                    child: Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFFF4D0).withValues(alpha: 0.65),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFD54F).withValues(alpha: 0.35),
                            blurRadius: 18,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFFD54F), Color(0xFFFFB300)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFB300).withValues(alpha: 0.35),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.bolt_rounded,
                            size: 38,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Title ("محاولاتك في فانكوش ⚡")
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'محاولاتك في فانكوش',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          color: ColorManager.textDark,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '⚡',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Subtitle ("فاضلك X محاولات مجانية")
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: Color(0xFF7E8A9A),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'inherit',
                      ),
                      children: [
                        const TextSpan(text: 'فاضلك '),
                        TextSpan(
                          text: '${AttemptsManager.remainingAttempts}',
                          style: const TextStyle(
                            color: Color(0xFFFF9800),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(text: ' محاولات مجانية'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Attempts Card with 3 Steps
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ColorManager.primaryLight,
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Step 3 (Left in RTL)
                        _buildAttemptStep(
                          number: '3',
                          status: AttemptsManager.remainingAttempts >= 3
                              ? 'متاحة'
                              : 'مستهلكة',
                        ),

                        // Connecting Line
                        Expanded(
                          child: Container(
                            height: 2.5,
                            margin: const EdgeInsets.only(
                              bottom: 24,
                              left: 8,
                              right: 8,
                            ),
                            color: const Color(0xFFFFE599),
                          ),
                        ),

                        // Step 2 (Middle)
                        _buildAttemptStep(
                          number: '2',
                          status: AttemptsManager.remainingAttempts >= 2
                              ? 'متاحة'
                              : 'مستهلكة',
                        ),

                        // Connecting Line
                        Expanded(
                          child: Container(
                            height: 2.5,
                            margin: const EdgeInsets.only(
                              bottom: 24,
                              left: 8,
                              right: 8,
                            ),
                            color: const Color(0xFFFFE599),
                          ),
                        ),

                        // Step 1 (Right in RTL)
                        _buildAttemptStep(
                          number: '1',
                          status: AttemptsManager.remainingAttempts >= 1
                              ? 'متاحة'
                              : 'مستهلكة',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Blue Outlined Button ("اكتشف الباقات ‹")
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ColorManager.blueLink,
                        backgroundColor: ColorManager.cardBackground,
                        side: const BorderSide(
                          color: ColorManager.blueLink,
                          width: 2.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlansScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اكتشف الباقات',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF299BF5),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.chevron_left_rounded,
                            size: 26,
                            color: Color(0xFF299BF5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Top-Right Close Button ("X")
            Positioned(
              top: 18,
              right: 18,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F3F7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Color(0xFF7E8A9A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttemptStep({required String number, required String status}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primaryColor,
            border: Border.all(color: Colors.white, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.textDark,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          status,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9E5C00),
          ),
        ),
      ],
    );
  }
}
