import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: QSText(
            'SEARCH',
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
