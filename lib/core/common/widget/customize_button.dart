import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final String? text;
  final Function() onTap;
  final double? borderRadius;
  final Widget? child;
  final double? height;
  const CustomizedButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    required this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return backgroundColor;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return Colors.white.withOpacity(0.2);
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            );
          }),
        ),
        child: Center(
          child: child ??
              Text(
                text ?? 'Button',
                style: textStyle ?? theme.textTheme.titleMedium,
              ),
        ),
      ),
    );
  }
}
