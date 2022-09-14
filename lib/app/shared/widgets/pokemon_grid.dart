import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/data/services/pokedex_controller.dart';
import 'package:flutter_plants_app_v2/app/views/data/pokemon_info_view.dart';
import 'package:flutter_plants_app_v2/app/shared/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({super.key});

  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  List? pokedex;

  Future<void> searchPokemonGOData() async {
    var url = Uri.http(
      'raw.githubusercontent.com',
      '/Biuni/PokemonGO-Pokedex/master/pokedex.json',
    );
    await http.get(url).then(
      (value) {
        if (value.statusCode == 200) {
          var decodeJsonData = jsonDecode(value.body);
          pokedex = decodeJsonData['pokemon'];
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      searchPokemonGOData();
    }
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final controller = Provider.of<PokedexController>(context);
  //   controller.searchPokemonData();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PokedexController>(context);
    return pokedex == null
        ? const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height / 1.47,
            child: GridView.builder(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: Constants.screenPadding,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.9,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: pokedex!.length,
              itemBuilder: (
                BuildContext context,
                index,
              ) {
                return GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: HexColor('E4E3E4'),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            pokedex![index]['img'],
                            fit: BoxFit.fitWidth,
                          ),
                          Text(
                            pokedex![index]['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonInfoView(
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
  }
}
