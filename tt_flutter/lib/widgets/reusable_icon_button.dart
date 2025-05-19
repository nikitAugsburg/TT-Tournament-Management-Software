import 'package:flutter/material.dart';

/// A reusable elevated button with an icon and label, with extra spacing and padding.
class ReusableIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double iconSize;
  final double iconLabelSpacing;
  final BorderRadiusGeometry? borderRadius;

  const ReusableIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.textStyle,
    this.iconSize = 24.0,
    this.iconLabelSpacing = 16.0,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 2, horizontal: 2), // Extra padding for button container
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 18),
          textStyle: textStyle ??
              const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(icon, size: iconSize),
            SizedBox(width: iconLabelSpacing), // More space after icon
            Expanded(
              child: Text(
                label,
                maxLines: null, // Allow unlimited lines
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
