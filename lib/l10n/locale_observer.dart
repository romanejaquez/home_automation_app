import 'package:flutter/material.dart';

class LocaleObserver extends WidgetsBindingObserver {
  LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}