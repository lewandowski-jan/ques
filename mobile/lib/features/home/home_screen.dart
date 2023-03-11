import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: QSText(
            'HOME',
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
