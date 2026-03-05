import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/widgets/app_text_styles.dart';
import 'package:fruitify_dashboard/widgets/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        foregroundColor: const Color(0xff272e33),
      ),
      child: SizedBox(
        height: 54,
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.bold16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
