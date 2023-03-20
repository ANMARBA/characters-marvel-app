import 'package:flutter/material.dart';

import '/core/presentation/constants/constants.dart';

class HeaderAppBar extends StatelessWidget {
  final String name;
  final String image;

  const HeaderAppBar({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 300,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 1),
                color: ColorConstants.mainColor,
              ),
            ],
          ),
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        background: Image.network(
          image,
          fit: BoxFit.cover,
          width: double.maxFinite,
        ),
      ),
    );
  }
}
