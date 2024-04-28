import 'package:flutter/material.dart';

abstract class AppEvent {}

class ChangeLanguageAppEvent extends AppEvent {
  Locale locale;
  ChangeLanguageAppEvent({
    required this.locale,
  });
}
