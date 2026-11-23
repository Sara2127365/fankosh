import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/localization/app_localization.dart';
import 'package:fankosh/core/services/attempts_manager.dart';
import 'package:fankosh/core/services/audio_picker_service.dart';
import 'package:fankosh/core/services/voice_permission_service.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/core/widgets/fankosh_bottom_nav_bar.dart';
import 'package:fankosh/feature/home/audio_review_screen.dart';
import 'package:fankosh/feature/home/out_of_attempts_screen.dart';
import 'package:fankosh/feature/home/recording_screen.dart';
import 'package:fankosh/feature/home/widgets/attempts_bottom_sheet.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isRecording = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleRecording() async {
    if (!AttemptsManager.hasAttempts) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OutOfAttemptsScreen(),
        ),
      );
      return;
    }

    final action = await VoicePermissionService.requestVoiceAction(context);
    if (!mounted) return;

    if (action == VoiceAction.record) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RecordingScreen()),
      );
    } else if (action == VoiceAction.upload) {
      _pickAudioFromDevice();
    }
  }

  void _pickAudioFromDevice() async {
    if (!AttemptsManager.hasAttempts) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OutOfAttemptsScreen(),
        ),
      );
      return;
    }

    final file = await AudioPickerService.pickAudioFile();
    if (file != null) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AudioReviewScreen(audioPath: file.path, audioName: file.name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: AppLocaleController.isArabic
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              // Scrollable Content
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 110, // padding for floating bottom nav
                  ),
                  child: Column(
                    children: [
                      // Top Custom App Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Profile Icon (Right in RTL)
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: ColorManager.textDark,
                              size: 28,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AccountScreen(),
                                ),
                              );
                            },
                          ),

                          // App Logo (Center)
                          Image.asset(
                            AppAssets.fankoshLogo,
                            height: 42,
                            fit: BoxFit.contain,
                          ),

                          // Notifications Bell (Left in RTL)
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
                                  builder: (context) =>
                                      const NotificationsScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Attempts Counter Badge (⚡ X محاولات)
                      ValueListenableBuilder<int>(
                        valueListenable:
                            AttemptsManager.remainingAttemptsNotifier,
                        builder: (context, remainingAttempts, _) {
                          return GestureDetector(
                            onTap: () {
                              if (remainingAttempts <= 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OutOfAttemptsScreen(),
                                  ),
                                );
                              } else {
                                showAttemptsBottomSheet(context);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.badgeYellowBg,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: ColorManager.primaryLight,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('⚡',
                                      style: TextStyle(fontSize: 14)),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$remainingAttempts محاولات',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF9E6C00),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Hero Character Illustration
                      Center(
                        child: Image.asset(
                          AppAssets.homeHeroCharacter,
                          height: size.height * 0.22,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Speech Bubble
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: AppLocaleController.isArabic
                            ? Image.asset(
                                AppAssets.speechBubble,
                                width: size.width * 0.82,
                                fit: BoxFit.contain,
                              )
                            : Container(
                                width: size.width * 0.82,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(26),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.06),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      context.tr.sayAnything,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: ColorManager.textDark,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      context.tr.willReplyWithEfieh,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),

                      const SizedBox(height: 10),

                      // Giant Glowing Record Button
                      GestureDetector(
                        onTap: _toggleRecording,
                        child: AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _isRecording ? _pulseAnimation.value : 1.0,
                              child: child,
                            );
                          },
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFFF2C2)
                                  .withValues(alpha: 0.5),
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              width: 106,
                              height: 106,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFFFDF70)
                                    .withValues(alpha: 0.7),
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 84,
                                height: 84,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: _isRecording
                                        ? [
                                            const Color(0xFFEF5350),
                                            const Color(0xFFE53935),
                                          ]
                                        : [
                                            const Color(0xFFFFCA28),
                                            const Color(0xFFFFB300),
                                          ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (_isRecording
                                              ? Colors.red
                                              : const Color(0xFFFFB300))
                                          .withValues(alpha: 0.4),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      _isRecording
                                          ? Icons.stop_rounded
                                          : Icons.mic_rounded,
                                      color: _isRecording
                                          ? Colors.white
                                          : ColorManager.textDark,
                                      size: 38,
                                    ),
                                    if (!_isRecording)
                                      const Positioned(
                                        top: 18,
                                        right: 18,
                                        child: Icon(
                                          Icons.auto_awesome,
                                          color: ColorManager.textDark,
                                          size: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Label below record button
                      Text(
                        _isRecording
                            ? context.tr.recording
                            : context.tr.pressToRecord,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Upload Audio Button ("أو ارفع مقطع صوتي")
                      GestureDetector(
                        onTap: _pickAudioFromDevice,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: ColorManager.borderAlt),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.tr.orUploadAudio,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.textAfterButton,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.file_upload_outlined,
                                size: 18,
                                color: Color(0xFF7E8A9A),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Floating Bottom Navigation Bar
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: FankoshBottomNavBar(
                  currentIndex: 0,
                  onTap: (index) {
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlansScreen(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
