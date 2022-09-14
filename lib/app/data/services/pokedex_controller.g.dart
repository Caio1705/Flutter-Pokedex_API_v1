// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokedexController on _PokedexControllerBase, Store {
  late final _$pokedexAtom =
      Atom(name: '_PokedexControllerBase.pokedex', context: context);

  @override
  List<dynamic>? get pokedex {
    _$pokedexAtom.reportRead();
    return super.pokedex;
  }

  @override
  set pokedex(List<dynamic>? value) {
    _$pokedexAtom.reportWrite(value, super.pokedex, () {
      super.pokedex = value;
    });
  }

  late final _$searchPokemonDataAsyncAction =
      AsyncAction('_PokedexControllerBase.searchPokemonData', context: context);

  @override
  Future<void> searchPokemonData() {
    return _$searchPokemonDataAsyncAction.run(() => super.searchPokemonData());
  }

  @override
  String toString() {
    return '''
pokedex: ${pokedex}
    ''';
  }
}
