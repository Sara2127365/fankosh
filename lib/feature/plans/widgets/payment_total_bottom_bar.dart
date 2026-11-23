import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class PaymentTotalBottomBar extends StatelessWidget {
  final int price;
  final VoidCallback onPay;
  final String buttonText;

  const PaymentTotalBottomBar({
    super.key,
    required this.price,
    required this.onPay,
    this.buttonText = 'ادفع الآن',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row: Total amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'الإجمالي المستحق',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontFamily: ColorManager.fontFamily),
                    children: [
                      TextSpan(
                        text: '$price ',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: ColorManager.goldAmber,
                        ),
                      ),
                      const TextSpan(
                        text: 'جنيه مصري',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Pay CTA Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  foregroundColor: ColorManager.textDark,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: onPay,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock_rounded,
                      size: 18,
                      color: ColorManager.textDark,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buttonText,
                      style: const TextStyle(
                        fontFamily: ColorManager.fontFamily,
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Footnote
            const Text(
              'سيتم تأكيد الدفع وتفعيل الباقة فورياً في حسابك.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.5,
                color: ColorManager.textAfterButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
