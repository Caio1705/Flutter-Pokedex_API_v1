import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/shared/constants/constants.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/pokemon_grid.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/rounded_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('F1EFEF'),
      body: Padding(
        padding: const EdgeInsets.only(
          right: Constants.screenPadding,
          left: Constants.screenPadding,
          top: Constants.screenPadding * 2.2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pokédex',
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Qual Pokémon você está procurando?',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            RoundedButton(
              color: HexColor('E4E3E4'),
              click: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.search,
                    color: HexColor('A2A1A3'),
                  ),
                  Text(
                    'Pesquisar Pokémon',
                    style: TextStyle(
                      color: HexColor('A2A1A3'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.7,
                  ),
                ],
              ),
            ),
            const PokemonGrid(),
          ],
        ),
      ),
    );
  }
}
