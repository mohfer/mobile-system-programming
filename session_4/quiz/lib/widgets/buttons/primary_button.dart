import 'package:flutter/material.dart';
import '../texts/custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color background = color ?? Theme.of(context).primaryColor;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(

        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          disabledBackgroundColor: background.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : CustomText(
                text: label,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
      ),
    );
  }
}
