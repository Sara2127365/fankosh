import 'package:fankosh/feature/home/widgets/mic_permission_dialog.dart';
import 'package:flutter/material.dart';

enum VoiceAction {
  record,
  upload,
  cancel,
}

class VoicePermissionService {
  /// دالة فحص وطلب إذن الميكروفون
  /// 1. تعرض نافذة التطبيق المخصصة الجميلة أولاً (MicPermissionDialog)
  /// 2. تتيح للمستخدم إما السماح بالتسجيل أو رفع ملف صوتي من الجهاز
  static Future<VoiceAction> requestVoiceAction(BuildContext context) async {
    final VoiceAction? action = await MicPermissionDialog.show(context);
    return action ?? VoiceAction.cancel;
  }

  static Future<bool> requestVoicePermission(BuildContext context) async {
    final action = await requestVoiceAction(context);
    return action == VoiceAction.record;
  }
}
