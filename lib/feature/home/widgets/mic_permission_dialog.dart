import 'package:fankosh/core/services/voice_permission_service.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class MicPermissionDialog extends StatelessWidget {
  final VoidCallback onAllow;
  final VoidCallback onDeny;
  final VoidCallback? onUpload;

  const MicPermissionDialog({
    super.key,
    required this.onAllow,
    required this.onDeny,
    this.onUpload,
  });

  static Future<VoiceAction?> show(BuildContext context) {
    return showDialog<VoiceAction>(
      context: context,
      barrierDismissible: true,
      builder: (context) => MicPermissionDialog(
        onAllow: () => Navigator.pop(context, VoiceAction.record),
        onDeny: () => Navigator.pop(context, VoiceAction.cancel),
        onUpload: () => Navigator.pop(context, VoiceAction.upload),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        backgroundColor: ColorManager.cardBackground,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Glowing Mic Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.badgeYellowBg,
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primaryColor.withValues(alpha: 0.25),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.mic_rounded,
                    size: 38,
                    color: ColorManager.textDark,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                'عايزين نسمعك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle Description
              const Text(
                'التطبيق محتاج إذن استخدام الميكروفون عشان تسجل الإفيه اللي فاكره ونطلعه في ثانية.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorManager.textMuted,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              // Allow Button (Yellow)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    foregroundColor: ColorManager.textDark,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: onAllow,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline_rounded, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'سماح',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Deny / Not Now Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorManager.greyButtonBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: onDeny,
                  child: const Text(
                    'مش دلوقتي',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textCharcoal,
                    ),
                  ),
                ),
              ),

              if (onUpload != null) ...[
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: onUpload,
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    size: 18,
                    color: ColorManager.blueLink,
                  ),
                  label: const Text(
                    'أو ارفع مقطع صوتي من الجهاز',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.blueLink,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
