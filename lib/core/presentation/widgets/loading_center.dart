import 'package:flutter/material.dart';

class LoadingCenter extends StatelessWidget {
  final Color color;
  const LoadingCenter({
    Key? key,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
