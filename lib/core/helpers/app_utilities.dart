import 'package:flutter/material.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import '../services/prevent_screenshot.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


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
  Future<void> init() async {
   // await _getSavedData();
     await enableSecureMode();
     iosPreventScreenShot();

    debugPrint("initialize app Successfully");
  }
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

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

  Future<bool> setSavedString(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      return true;
    } catch (e) {
      debugPrint("Error saving string for key '$key': $e");
      return false;
    }
  }

  Future<String> getSavedString(String key, String defaultVal) async {
    try {
      final value = await _storage.read(key: key);
      return value ?? defaultVal;
    } catch (e) {
      debugPrint("Error reading string for key '$key': $e");
      return defaultVal;
    }
  }

  Future<bool> setSavedBool(String key, bool value) async {
    try {
      await _storage.write(key: key, value: value.toString());
      return true;
    } catch (e) {
      debugPrint("Error saving bool for key '$key': $e");
      return false;
    }
  }

  Future<bool> getSavedBool(String key, {bool defaultVal = false}) async {
    try {
      final value = await _storage.read(key: key);
      if (value == null) return defaultVal;
      return value.toLowerCase() == 'true';
    } catch (e) {
      debugPrint("Error reading bool for key '$key': $e");
      return defaultVal;
    }
  }
}
