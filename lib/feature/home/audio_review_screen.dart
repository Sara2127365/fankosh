import 'dart:async';
import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/services/attempts_manager.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/home/efieh_result_screen.dart';
import 'package:fankosh/feature/home/recording_screen.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class AudioReviewScreen extends StatefulWidget {
  final String? audioPath;
  final String? audioName;
  final bool isRecorded;
  final int durationSeconds;

  const AudioReviewScreen({
    super.key,
    this.audioPath,
    this.audioName,
    this.isRecorded = true,
    this.durationSeconds = 5,
  });

  @override
  State<AudioReviewScreen> createState() => _AudioReviewScreenState();
}

class _AudioReviewScreenState extends State<AudioReviewScreen> {
  bool _isPlaying = false;
  int _currentSeconds = 0;
  Timer? _playbackTimer;

  final List<double> _waveformHeights = [
    18, 30, 24, 40, 28, 44, 32, 22, 38, 48,
    30, 42, 26, 36, 44, 28, 38, 20, 32, 24,
  ];

  @override
  void dispose() {
    _playbackTimer?.cancel();
    super.dispose();
  }

  void _togglePlayback() {
    if (_isPlaying) {
      _playbackTimer?.cancel();
      setState(() {
        _isPlaying = false;
      });
    } else {
      setState(() {
        _isPlaying = true;
      });
      _playbackTimer?.cancel();
      _playbackTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) return;
        setState(() {
          _currentSeconds++;
          if (_currentSeconds >= widget.durationSeconds) {
            _currentSeconds = 0;
            _isPlaying = false;
            timer.cancel();
          }
        });
      });
    }
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
              // Custom Top App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Notifications
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

                    // Logo
                    Image.asset(
                      AppAssets.fankoshLogo,
                      height: 40,
                      fit: BoxFit.contain,
                    ),

                    // Profile Icon
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

              const SizedBox(height: 16),

              // Title Section: Distinct for recorded vs uploaded
              Text(
                widget.isRecorded ? 'ده تسجيلك!' : 'المقطع المرفوع 🎵',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.isRecorded
                    ? 'اسمعه ولو حابب سجل من جديد'
                    : (widget.audioName ?? 'اسمعه وتأكد منه'),
                style: const TextStyle(
                  fontSize: 14,
                  color: ColorManager.textMuted,
                ),
              ),

              const SizedBox(height: 28),

              // Main Waveform Player Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 26,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.cardBackground,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: ColorManager.borderLight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Audio Waveform Visualization with Dynamic Progress
                      SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(_waveformHeights.length, (
                            index,
                          ) {
                            final totalBars = _waveformHeights.length;
                            final activeThreshold = widget.durationSeconds > 0
                                ? (_currentSeconds / widget.durationSeconds) * totalBars
                                : 0;
                            final isPassed = index <= activeThreshold;

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2.2,
                              ),
                              width: 4,
                              height: _waveformHeights[index],
                              decoration: BoxDecoration(
                                color: isPassed
                                    ? ColorManager.primaryColor
                                    : const Color(0xFFE4E7EC),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Duration Indicators
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatTime(_currentSeconds),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textDark,
                              ),
                            ),
                            Text(
                              _formatTime(widget.durationSeconds),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Large Yellow Play/Pause Button
                      GestureDetector(
                        onTap: _togglePlayback,
                        child: Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.primaryColor.withValues(
                                  alpha: 0.35,
                                ),
                                blurRadius: 14,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            _isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 38,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Action Buttons: Delete & Re-record
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    // Delete Recording
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: ColorManager.cardBackgroundLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: ColorManager.borderLight),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_outline_rounded,
                                size: 18,
                                color: ColorManager.redStatus,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'حذف التسجيل',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.redStatus,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Re-record Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RecordingScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: ColorManager.cardBackgroundLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: ColorManager.borderLight),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mic_outlined,
                                size: 18,
                                color: ColorManager.amberIcon,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'سجل من جديد',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Find Efieh CTA Button ("يلا نلاقي الإفيه!")
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: ColorManager.textDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      AttemptsManager.consumeAttempt();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EfiehResultScreen(
                            userDuration: widget.durationSeconds,
                            isRecorded: widget.isRecorded,
                          ),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 20,
                          color: ColorManager.textDark,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'يلا نلاقي الإفيه!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ],
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
