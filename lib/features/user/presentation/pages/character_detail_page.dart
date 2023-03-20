import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/application/bloc/characters.dart';
import '/core/domain/entities/character_entity.dart';
import '/core/presentation/constants/constants.dart';
import '/features/user/presentation/widgets/character_detail/detail_expandable_panel.dart';
import '/features/user/presentation/widgets/character_detail/header_app_bar.dart';

class CharacterDetailPage extends StatefulWidget {
  final dynamic character;

  const CharacterDetailPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  late CharacterEntity character;
  @override
  void initState() {
    super.initState();
    character = widget.character as CharacterEntity;
    Future.microtask(
      () => context
          .read<CharactersBloc>()
          .add(CharactersEvent.getComicsByCharacter(
            characterId: character.id,
          )),
    );

    Future.microtask(
      () => context
          .read<CharactersBloc>()
          .add(CharactersEvent.getEventsByCharacter(
            characterId: character.id,
          )),
    );

    Future.microtask(
      () => context
          .read<CharactersBloc>()
          .add(CharactersEvent.getSeriesByCharacter(
            characterId: character.id,
          )),
    );

    Future.microtask(
      () => context
          .read<CharactersBloc>()
          .add(CharactersEvent.getStoriesByCharacter(
            characterId: character.id,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainColor,
      body: CustomScrollView(
        slivers: <Widget>[
          HeaderAppBar(
            name: character.name,
            image: character.fullPath,
          ),
          SliverToBoxAdapter(
            child: character.description.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(
                      character.description,
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(height: 20),
          ),
          BlocBuilder<CharactersBloc, CharactersState>(
            buildWhen: (_, state) {
              return state.maybeWhen(
                orElse: () => false,
                dataComicsByCharacter: (_) => true,
              );
            },
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => const SliverToBoxAdapter(child: SizedBox()),
                dataComicsByCharacter: (data) {
                  if (data.results.isEmpty) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  return SliverToBoxAdapter(
                    child: DetailExpandablePanel(
                      headerName: 'Comics',
                      contentList: data.results.map((e) => e.title).toList(),
                    ),
                  );
                },
              );
            },
          ),
          BlocBuilder<CharactersBloc, CharactersState>(
            buildWhen: (_, state) {
              return state.maybeWhen(
                orElse: () => false,
                dataEventsByCharacter: (_) => true,
              );
            },
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => const SliverToBoxAdapter(child: SizedBox()),
                dataEventsByCharacter: (data) {
                  if (data.results.isEmpty) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  return SliverToBoxAdapter(
                    child: DetailExpandablePanel(
                      headerName: 'Events',
                      contentList: data.results.map((e) => e.title).toList(),
                    ),
                  );
                },
              );
            },
          ),
          BlocBuilder<CharactersBloc, CharactersState>(
            buildWhen: (_, state) {
              return state.maybeWhen(
                orElse: () => false,
                dataSeriesByCharacter: (_) => true,
              );
            },
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => const SliverToBoxAdapter(child: SizedBox()),
                dataSeriesByCharacter: (data) {
                  if (data.results.isEmpty) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  return SliverToBoxAdapter(
                    child: DetailExpandablePanel(
                      headerName: 'Series',
                      contentList: data.results.map((e) => e.title).toList(),
                    ),
                  );
                },
              );
            },
          ),
          BlocBuilder<CharactersBloc, CharactersState>(
            buildWhen: (_, state) {
              return state.maybeWhen(
                orElse: () => false,
                dataStoriesByCharacter: (_) => true,
              );
            },
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => const SliverToBoxAdapter(child: SizedBox()),
                dataStoriesByCharacter: (data) {
                  if (data.results.isEmpty) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  return SliverToBoxAdapter(
                    child: DetailExpandablePanel(
                      headerName: 'Stories',
                      contentList: data.results.map((e) => e.title).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
