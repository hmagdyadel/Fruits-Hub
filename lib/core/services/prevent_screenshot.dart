import 'dart:io';

import 'package:flutter/services.dart';

class ScreenRecordingDetector {
  static const MethodChannel _channel = MethodChannel('screen_recording_detector');

  /// Check if the screen is being recorded
  static Future<bool> isScreenBeingRecorded() async {
    if (Platform.isIOS) {
      final bool isCaptured = await _channel.invokeMethod('isCaptured');
      return isCaptured;
    }
    return false;
  }

  /// Start listening to screen recording changes
  static void startListening(Function(bool isRecording) onChanged) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onCaptureChanged') {
        final isRecording = call.arguments as bool;
        onChanged(isRecording);
      }
    });
  }
}
