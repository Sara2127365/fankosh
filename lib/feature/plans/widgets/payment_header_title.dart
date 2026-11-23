import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class PaymentHeaderTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBack;

  const PaymentHeaderTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
            ),
            InkWell(
              onTap: onBack ?? () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: ColorManager.cardBackground,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  size: 28,
                  color: ColorManager.textDark,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: ColorManager.titleAuth),
        ),
      ],
    );
  }
}
