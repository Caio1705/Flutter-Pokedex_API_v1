// flutter pub run build_runner watch --delete-conflicting-outputs --use-polling-watcher

import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'pokedex_controller.g.dart';

class PokedexController = _PokedexControllerBase with _$PokedexController;

abstract class _PokedexControllerBase with Store {
  @observable
  List? pokedex;

  @action
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
        }
      },
    );
  }
}
