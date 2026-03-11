import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/core/widgets/app_text_styles.dart';
import 'package:fruitify_dashboard/core/widgets/constants.dart';

void showErrorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Flexible(child: Text(text, style: AppTextStyles.semiBold16)),
        ],
      ),
      backgroundColor: errorColor,
    ),
  );
}
