// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NextAndPreviousEvolution extends StatefulWidget {
  const NextAndPreviousEvolution({
    super.key,
    required this.index,
  });
  final index;

  @override
  State<NextAndPreviousEvolution> createState() =>
      _NextAndPreviousEvolutionState(index);
}

class _NextAndPreviousEvolutionState extends State<NextAndPreviousEvolution> {
  _NextAndPreviousEvolutionState(this.index);
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

  @override
  Widget build(BuildContext context) {
    return pokedex == null
        ? const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : pokedex![index]['next_evolution'] == null &&
                pokedex![index]['prev_evolution'] == null
            ? const Center(
                child: Text('This Pokemon doesn\'t have any evolution'),
              )
            : Padding(
                padding: const EdgeInsets.all(30),
                child: pokedex![index]['next_evolution'] == null
                    ? Column(
                        children: [
                          const Text(
                            'Previous Evolutions',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 95,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  pokedex![index]['prev_evolution'].length,
                              itemBuilder: (
                                BuildContext context,
                                int prevEvolution,
                              ) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        pokedex![index]['prev_evolution']
                                            [prevEvolution]['name'],
                                      ),
                                    ),
                                    Text(
                                      '#${pokedex![index]['prev_evolution'][prevEvolution]['num']}',
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : pokedex![index]['prev_evolution'] == null
                        ? Column(
                            children: [
                              const Text(
                                'Next Evolutions',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 95,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount:
                                      pokedex![index]['next_evolution'].length,
                                  itemBuilder: (
                                    BuildContext context,
                                    int nextEvolution,
                                  ) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            pokedex![index]['next_evolution']
                                                [nextEvolution]['name'],
                                          ),
                                        ),
                                        Text(
                                          '#${pokedex![index]['next_evolution'][nextEvolution]['num']}',
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const Text(
                                'Previous Evolution',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 47.5,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount:
                                      pokedex![index]['prev_evolution'].length,
                                  itemBuilder: (
                                    BuildContext context,
                                    int prevEvolution,
                                  ) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            pokedex![index]['prev_evolution']
                                                [prevEvolution]['name'],
                                          ),
                                        ),
                                        Text(
                                          '#${pokedex![index]['prev_evolution'][prevEvolution]['num']}',
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Next Evolution',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 47.5,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount:
                                      pokedex![index]['next_evolution'].length,
                                  itemBuilder: (
                                    BuildContext context,
                                    int nextEvolution,
                                  ) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            pokedex![index]['next_evolution']
                                                [nextEvolution]['name'],
                                          ),
                                        ),
                                        Text(
                                          '#${pokedex![index]['next_evolution'][nextEvolution]['num']}',
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
              );
  }
}
