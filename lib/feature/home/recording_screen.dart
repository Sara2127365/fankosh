import 'dart:async';
import 'dart:math';
import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/home/audio_review_screen.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen>
    with SingleTickerProviderStateMixin {
  static const int _maxDuration = 5;
  int _secondsElapsed = 0;
  Timer? _countdownTimer;

  late AnimationController _waveController;
  final List<double> _baseHeights = [
    14, 26, 18, 38, 22, 42, 34, 16, 36, 44,
    28, 46, 24, 38, 18, 32, 40, 26, 34, 18,
    30, 22, 40, 32, 16,
  ];

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _startTimer();
  }

  void _startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _secondsElapsed++;
      });

      if (_secondsElapsed >= _maxDuration) {
        _stopRecording();
      }
    });
  }

  void _stopRecording() {
    _countdownTimer?.cancel();
    final duration = _secondsElapsed > 0 ? _secondsElapsed : 5;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AudioReviewScreen(
          isRecorded: true,
          durationSeconds: duration,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _waveController.dispose();
    super.dispose();
  }

  String _formatTime(int sec) {
    return '00:0$sec';
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
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
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
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // Title: قول اللي في بالك.. سامعينك!
              const Text(
                'قول اللي في بالك..\nسامعينك!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1E232A),
                  height: 1.35,
                ),
              ),

              const SizedBox(height: 28),

              // Recording Status Pill (00:05 | ...جاري التسجيل ●)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFFF1F3F6),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Red pulsing dot & text
                    Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD32F2F),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'جاري التسجيل...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD32F2F),
                      ),
                    ),

                    // Divider
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: 16,
                      width: 1,
                      color: const Color(0xFFE2E6EC),
                    ),

                    // Timer Text
                    Text(
                      _formatTime(_secondsElapsed),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E232A),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Audio Waveform Visualization
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9E6),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: AnimatedBuilder(
                    animation: _waveController,
                    builder: (context, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(_baseHeights.length, (index) {
                          final factor = sin(
                            (_waveController.value * pi * 2) + (index * 0.4),
                          );
                          final currentHeight = (_baseHeights[index] + (factor * 8))
                              .clamp(8.0, 46.0);

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.2),
                            width: 3.5,
                            height: currentHeight,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7BD1E),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),

              const Spacer(),

              // Giant Red Stop Button
              GestureDetector(
                onTap: _stopRecording,
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFCDD2).withValues(alpha: 0.5),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFEF5350),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEF5350).withValues(alpha: 0.45),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Label: اضغط لإنهاء التسجيل
              const Text(
                'اضغط لإنهاء التسجيل',
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E232A),
                ),
              ),

              const SizedBox(height: 6),

              // Subtext: الحد الأقصى للتسجيل: 05 ثانية ⏱
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 15,
                    color: Color(0xFF8A94A6),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'الحد الأقصى للتسجيل: 05 ثانية',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8A94A6),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
