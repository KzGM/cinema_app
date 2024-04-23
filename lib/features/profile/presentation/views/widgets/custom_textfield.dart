import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key, required this.title, this.titleStyle, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: titleStyle ??
                    const TextStyle(fontSize: 14, color: Colors.white),
              )),
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.withOpacity(0.2))),
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: InputBorder.none,
                  hintText: 'Enter value',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
