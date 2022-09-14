// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/container_text_type.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class Stats extends StatefulWidget {
  const Stats({
    super.key,
    required this.index,
  });
  final index;

  @override
  State<Stats> createState() => _StatsState(index);
}

class _StatsState extends State<Stats> {
  final index;

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

  _StatsState(this.index);
  @override
  Widget build(BuildContext context) {
    return pokedex == null
        ? const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pokedex![index]['height'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pokedex![index]['weight'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Candy',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pokedex![index]['candy'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Egg',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pokedex![index]['egg'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Average Spawn',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${pokedex![index]['avg_spawns']}%',
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
