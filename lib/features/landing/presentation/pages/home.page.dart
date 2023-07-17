import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home'),
    );
  }
}