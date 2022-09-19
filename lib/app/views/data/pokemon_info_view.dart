// ignore_for_file: prefer_typing_uninitialized_variables
// ignore_for_file: no_logic_in_create_state

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/shared/constants/constants.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/poke_stats/container_stats.dart';
import 'package:http/http.dart' as http;

class PokemonInfoView extends StatefulWidget {
  const PokemonInfoView({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<PokemonInfoView> createState() => _PokemonInfoViewState(index);
}

class _PokemonInfoViewState extends State<PokemonInfoView> {
  final index;

  List? pokedex;

  _PokemonInfoViewState(this.index);

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

  @override
  Widget build(BuildContext context) {
    final containerStack = MediaQuery.of(context).size.height / 6;
    final containerSize = MediaQuery.of(context).size.height / 2;
    return pokedex == null
        ? const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.grey.shade400,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: Constants.screenPadding,
                        left: Constants.screenPadding,
                        top: Constants.screenPadding * 2.2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: Constants.screenPadding,
                        left: Constants.screenPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pokedex![index]['name'],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '#${pokedex![index]['num']}',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: containerStack,
                              width: double.infinity,
                              color: Colors.grey.shade400,
                            ),
                            Container(
                              height: 200 - containerStack,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 170,
                              width: 400,
                              child: Image.network(
                                pokedex![index]['img'],
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            // ContainerTextType(
                            //   index: index,
                            // )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: containerSize * 0.9,
                    ),
                  ],
                ),
                ContainerStats(
                  containerSize: containerSize,
                  index: index,
                ),
              ],
            ),
          );
  }
}
