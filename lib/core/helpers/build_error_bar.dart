import 'package:flutter/material.dart';

void buildErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.add_alert_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(message),
        ],
      ),
    ),
  );
}
