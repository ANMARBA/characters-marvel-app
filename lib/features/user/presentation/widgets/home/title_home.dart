import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  final String title;
  const TitleHome({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}
