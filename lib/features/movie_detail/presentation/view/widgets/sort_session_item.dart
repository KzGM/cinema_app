import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/utils/localizations.dart';

class SortSessionItem extends StatefulWidget {
  const SortSessionItem({
    super.key,
  });

  @override
  State<SortSessionItem> createState() => _SortSessionItemState();
}

class _SortSessionItemState extends State<SortSessionItem> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.svg.icSort,
          width: 24,
          height: 24,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          translate(context).time,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
