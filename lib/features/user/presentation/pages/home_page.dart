import 'package:flutter/material.dart';

import '/core/presentation/constants/constants.dart';
import '/features/user/presentation/widgets/home/grid_view_characters.dart';
import '/features/user/presentation/widgets/home/title_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainColor,
      body: SafeArea(
        child: Column(
          children: const [
            TitleHome(title: 'characters'),
            GridViewCharacters(),
          ],
        ),
      ),
    );
  }
}
