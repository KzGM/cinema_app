import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  Function() onPress;
  TextStyle? textStyle;
  String? text;
  Color? backgroundColor;
  double? borderRadius;
  CustomizeButton({
    Key? key,
    required this.onPress,
    this.textStyle,
    this.text,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? theme.colorScheme.primary,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
      ),
      child: Text(
        text ?? 'Nhập title',
        style: textStyle ??
            TextStyle(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
