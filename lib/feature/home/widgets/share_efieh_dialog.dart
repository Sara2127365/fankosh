import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class ShareEfiehDialog extends StatefulWidget {
  const ShareEfiehDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const ShareEfiehDialog(),
    );
  }

  @override
  State<ShareEfiehDialog> createState() => _ShareEfiehDialogState();
}

class _ShareEfiehDialogState extends State<ShareEfiehDialog> {
  bool _isPlaying = false;

  final List<double> _waveformHeights = [
    14, 26, 18, 36, 28, 44, 30, 48, 38, 22, 34, 40, 24, 32, 18
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        backgroundColor: ColorManager.cardBackground,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close (X) button at top left
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: ColorManager.greyButtonBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: ColorManager.textMuted,
                    ),
                  ),
                ),
              ),

              // Glowing Share Icon Header
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.badgeYellowBg,
                ),
                child: const Center(
                  child: Icon(
                    Icons.share_outlined,
                    size: 30,
                    color: ColorManager.amberDark,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Title
              const Text(
                'عجبك رد فانكوش؟ 😂',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),

              const SizedBox(height: 6),

              // Subtitle
              const Text(
                'شارك كلامك ورد فانكوش مع صحابك!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: ColorManager.textMuted,
                ),
              ),

              const SizedBox(height: 20),

              // Mini Combined Audio Preview Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFDF7),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFFFECC4)),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '00:27',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textMuted,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'صوتك + رد فانكوش',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textDark,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.movie_outlined, size: 14, color: ColorManager.amberDark),
                            SizedBox(width: 4),
                            Icon(Icons.mic, size: 14, color: ColorManager.amberDark),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Waveform + Play Button
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: ColorManager.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                              size: 24,
                              color: ColorManager.textDark,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(_waveformHeights.length, (index) {
                              final isPassed = index >= 5;
                              return Container(
                                width: 3,
                                height: _waveformHeights[index],
                                decoration: BoxDecoration(
                                  color: isPassed ? ColorManager.primaryColor : const Color(0xFFD0D5DD),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Share Button (Yellow)
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
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم فتح خيارات المشاركة! 🎉'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share_outlined, size: 18, color: ColorManager.textDark),
                      SizedBox(width: 8),
                      Text(
                        'شارك القفشة',
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

              // Not Now Button
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
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'مش دلوقتي',
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textCharcoal,
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
}
