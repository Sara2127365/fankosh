import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class WalletOptionTile extends StatelessWidget {
  final String title;
  final Widget iconWidget;
  final bool isSelected;
  final VoidCallback onTap;

  const WalletOptionTile({
    super.key,
    required this.title,
    required this.iconWidget,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.primaryLight : ColorManager.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? ColorManager.primaryColor : ColorManager.borderColor,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ColorManager.primaryColor.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Radio circle indicator on the right side in RTL
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? ColorManager.primaryColor : ColorManager.buttonUnSelectedPlan,
                  width: 2,
                ),
                color: ColorManager.cardBackground,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 14),

            // Provider Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  color: ColorManager.textDark,
                ),
              ),
            ),

            // Provider Icon / Logo on the left side
            iconWidget,
          ],
        ),
      ),
    );
  }
}
