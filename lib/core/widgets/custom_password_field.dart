import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;

  const CustomPasswordField({super.key, required this.onSaved});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child:obscureText? const Icon(
          Icons.visibility,
          color: Color(0xFFC9CECF),
        ):const Icon(
          Icons.visibility_off,
          color: Color(0xFFC9CECF),
        ),
      ),
    );
  }
}
