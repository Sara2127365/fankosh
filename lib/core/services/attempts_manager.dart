import 'package:flutter/material.dart';

class AttemptsManager {
  static final ValueNotifier<int> remainingAttemptsNotifier =
      ValueNotifier<int>(3);

  static int get remainingAttempts => remainingAttemptsNotifier.value;

  static bool get hasAttempts => remainingAttempts > 0;

  static void consumeAttempt() {
    if (remainingAttempts > 0) {
      remainingAttemptsNotifier.value = remainingAttempts - 1;
    }
  }

  static void resetAttempts([int count = 3]) {
    remainingAttemptsNotifier.value = count;
  }
}
