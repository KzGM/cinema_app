import 'package:flutter/material.dart';

import '../../../../../core/utils/localizations.dart';

class ByCinemaSessionItem extends StatefulWidget {
  const ByCinemaSessionItem({
    super.key,
  });

  @override
  State<ByCinemaSessionItem> createState() => _ByCinemaSessionItemState();
}

class _ByCinemaSessionItemState extends State<ByCinemaSessionItem> {
  DateTime selectedDate = DateTime.now();
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
                print('test $value');
              },
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          translate(context).byCinema,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
