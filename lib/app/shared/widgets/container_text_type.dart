// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContainerTextType extends StatefulWidget {
  final index;

  const ContainerTextType({
    super.key,
    required this.index,
  });

  @override
  State<ContainerTextType> createState() => _ContainerTextTypeState(index);
}

class _ContainerTextTypeState extends State<ContainerTextType> {
  final index;

  _ContainerTextTypeState(this.index);

  List? pokedex;

  Future<void> searchPokemonData() async {
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
      searchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: (pokedex![index]['type']).length,
      itemBuilder: (
        BuildContext context,
        int tipo,
      ) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                pokedex![index]['type'][tipo],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
