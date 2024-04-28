import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/utils/localizations.dart';

class AccountSavedCardWidget extends StatefulWidget {
  const AccountSavedCardWidget({super.key});

  @override
  State<AccountSavedCardWidget> createState() => _AccountSavedCardWidgetState();
}

class _AccountSavedCardWidgetState extends State<AccountSavedCardWidget> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(context).savedCard,
          style: _textTheme.titleMedium
              ?.copyWith(color: _colorScheme.primaryContainer),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _colorScheme.outline,
                border:
                    Border.all(width: 1, color: _colorScheme.primaryContainer),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.svg.icVisa),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      '4716 •••• •••• 5615',
                      style: _textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    '06/24',
                    style: _textTheme.bodyMedium
                        ?.copyWith(color: _colorScheme.primaryContainer),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: _colorScheme.primaryContainer),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                translate(context).addNewCard,
                style: _textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
