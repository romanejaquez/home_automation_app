import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  static const String route = '/settings';
  
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('settings'),
    );
  }
}