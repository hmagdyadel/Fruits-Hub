import 'package:flutter/material.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import '../services/prevent_screenshot.dart';

class AppUtilities {
  static final AppUtilities _instance = AppUtilities._internal();

  static AppUtilities get instance => _instance;

  factory AppUtilities() {
    return _instance;
  }

  final ValueNotifier<bool> isRecordingNotifier = ValueNotifier(false);

  AppUtilities._internal();

  Future<void> enableSecureMode() async {
    await FlutterWindowManagerPlus.addFlags(FlutterWindowManagerPlus.FLAG_SECURE);
  }

  void iosPreventScreenShot() {
    debugPrint("prevent screen shot init");

    ScreenRecordingDetector.startListening((isRecording) {
      isRecordingNotifier.value = isRecording;
      debugPrint("🔴 Screen recording status changed: $isRecording");
    });

    ScreenRecordingDetector.isScreenBeingRecorded().then((isRecording) {
      isRecordingNotifier.value = isRecording;
      debugPrint("Initial screen recording: $isRecording");
    });
  }
}
