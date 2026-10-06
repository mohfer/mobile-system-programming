import 'package:flutter/material.dart';
import '../texts/custom_text.dart';

class TextLinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const TextLinkButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: CustomText(
        text: text,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
