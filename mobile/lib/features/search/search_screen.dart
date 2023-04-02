import 'package:flutter/material.dart';
import 'package:ques/features/maps/map_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapBody(),
    );
  }
}
