import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/application/bloc/characters.dart';
import '/core/presentation/widgets/loading_center.dart';
import '/features/user/presentation/widgets/home/view_character.dart';

class GridViewCharacters extends StatelessWidget {
  const GridViewCharacters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      buildWhen: (_, state) {
        return state.maybeWhen(
          orElse: () => false,
          loading: () => true,
          dataCharacters: (_) => true,
        );
      },
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loading: () => const LoadingCenter(),
          dataCharacters: (data) {
            return Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: data.results.length,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 5,
                  maxCrossAxisExtent: 300,
                ),
                itemBuilder: (_, int index) {
                  return ViewCharacter(character: data.results[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
