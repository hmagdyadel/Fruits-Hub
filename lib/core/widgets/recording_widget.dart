import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/constants.dart';
class RecordingOverlay extends StatelessWidget {
  const RecordingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [

          const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 60),
          SizedBox(height: 16,width: width.w,),
          const Text(
            "Screen recording is active.\nFor your privacy, some content is hidden.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
