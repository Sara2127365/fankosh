import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class AudioPickerService {
  /// يفتح نافذة اختيار الملفات على Android و iOS لاختيار مقطع صوتي من الجهاز
  static Future<PlatformFile?> pickAudioFile() async {
    try {
      FilePickerResult? result;
      try {
        result = await FilePicker.platform.pickFiles(
          type: FileType.audio,
          allowMultiple: false,
        );
      } catch (e) {
        debugPrint('Fallback to custom audio extensions: $e');
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['mp3', 'wav', 'm4a', 'aac', 'ogg', 'opus', 'flac'],
          allowMultiple: false,
        );
      }

      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      }
    } catch (e) {
      debugPrint('Error picking audio file: $e');
    }
    return null;
  }
}
