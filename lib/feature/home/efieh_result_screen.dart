import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/home/widgets/share_efieh_dialog.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class EfiehResultScreen extends StatefulWidget {
  final int userDuration;
  final bool isRecorded;

  const EfiehResultScreen({
    super.key,
    this.userDuration = 5,
    this.isRecorded = true,
  });

  @override
  State<EfiehResultScreen> createState() => _EfiehResultScreenState();
}

class _EfiehResultScreenState extends State<EfiehResultScreen> {
  bool _isLoading = true;
  bool _isPlayingResponse = false;

  final List<double> _responseWaveform = [
    14,
    28,
    20,
    36,
    48,
    30,
    42,
    52,
    34,
    46,
    50,
    28,
    44,
    38,
    24,
  ];

  @override
  void initState() {
    super.initState();
    // Simulate smart AI response after 2.5 seconds
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
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
              // Custom Top App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
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

              const SizedBox(height: 10),

              // Title
              const Text(
                'فانكوش بيحضّرك الرد! 🍿',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),

              const SizedBox(height: 16),

              // Compact User Voice Pill at top
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7DC),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '00:0${widget.userDuration}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Mini waveform bars
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(12, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: 3,
                              height: (index % 3 + 1) * 7.0 + 4,
                              decoration: BoxDecoration(
                                color: ColorManager.amberDark,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: ColorManager.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 22,
                          color: ColorManager.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Content: Loading state vs Ready Response State
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _isLoading ? _buildLoadingCard() : _buildFoundCard(),
                ),
              ),

              // Bottom Input Bar
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  // State 1: Searching for Efieh (Loading)
  Widget _buildLoadingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'جارٍ التعرف',
                style: TextStyle(
                  fontSize: 12,
                  color: ColorManager.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.badgeYellowBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'فانكوش الذكي',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.amberDark,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.auto_awesome,
                      size: 12,
                      color: ColorManager.amberDark,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'استنى..',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: ColorManager.textDark,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'بنحضرلك رد جامد ! 🎬',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: ColorManager.textDark,
            ),
          ),

          const SizedBox(height: 20),

          // Animated Searching Container
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF8),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFFFECC4)),
            ),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: ColorManager.badgeYellowBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.search_rounded,
                    color: ColorManager.amberDark,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'بندور على الإفيه المناسب..',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 10),
                // 3 Animated Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: ColorManager.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: ColorManager.goldAmber,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: ColorManager.amberDark,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // State 2: Efieh Ready (Found)
  Widget _buildFoundCard() {
    return Column(
      children: [
        // Assistant Speech Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: ColorManager.cardBackground,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: ColorManager.borderLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.badgeYellowBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'فانكوش الذكي',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.amberDark,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.auto_awesome,
                      size: 12,
                      color: ColorManager.amberDark,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'أيوووه! قفشت الإفيه! 😍',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'استنى بقى... اسمع دي! 😂',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textMuted,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Response Player Card
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: ColorManager.cardBackground,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: ColorManager.borderLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'HQ • 320kbps',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.textMuted,
                ),
              ),

              const SizedBox(height: 12),

              // Audio Waveform with Large Play Button
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.cardBackgroundLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    // Play / Pause Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPlayingResponse = !_isPlayingResponse;
                        });
                      },
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.primaryColor.withValues(
                                alpha: 0.35,
                              ),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isPlayingResponse
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 32,
                          color: ColorManager.textDark,
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // Waveform Bars & Time
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(_responseWaveform.length, (
                              index,
                            ) {
                              final isPassed = index >= 6;
                              return Container(
                                width: 3.5,
                                height: _responseWaveform[index],
                                decoration: BoxDecoration(
                                  color: isPassed
                                      ? ColorManager.primaryColor
                                      : const Color(0xFFD0D5DD),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '00:08',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.textDark,
                                ),
                              ),
                              Text(
                                '00:22',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  color: ColorManager.textMuted,
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

              const SizedBox(height: 14),

              // "خد الإفيه ده عندك!" Share Button
              GestureDetector(
                onTap: () {
                  ShareEfiehDialog.show(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    color: ColorManager.cardBackgroundLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.volume_up_outlined,
                        size: 18,
                        color: ColorManager.textCharcoal,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'خد الإفيه ده عندك! 🎧',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textCharcoal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Bottom Input Bar
  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Upload / Document Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: ColorManager.cardBackground,
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.borderLight),
            ),
            child: const Icon(
              Icons.upload_file_rounded,
              color: ColorManager.textHint,
              size: 20,
            ),
          ),

          const SizedBox(width: 10),

          // Text Field
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: ColorManager.cardBackground,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: ColorManager.borderLight),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'قول أي حاجة...',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: ColorManager.textHint,
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mic,
                      size: 18,
                      color: ColorManager.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_isLoading) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF47B2FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'جارٍ البحث',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
