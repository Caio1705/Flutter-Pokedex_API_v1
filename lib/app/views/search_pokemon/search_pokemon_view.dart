import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/shared/constants/constants.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/pokemon_grid.dart';

class SearchPokemonView extends StatefulWidget {
  const SearchPokemonView({super.key});

  @override
  State<SearchPokemonView> createState() => _SearchPokemonViewState();
}

class _SearchPokemonViewState extends State<SearchPokemonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          right: Constants.screenPadding,
          left: Constants.screenPadding,
        ),
        child: PokemonGrid(
          division: 1,
          topPadding: Constants.screenPadding,
        ),
      ),
    );
  }
}
