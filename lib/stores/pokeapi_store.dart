import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/constants/consts.dart';
import 'package:pokemon_app/models/pokeapi.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi pokeApi;

  @action
  fetchPokemonList() {
    pokeApi = null;

    loadPokeApi().then((pokeList) {
      pokeApi = pokeList;
    });
  }

  Future<PokeApi> loadPokeApi() async {
    try {
      final response = await http.get(Consts.apiDomain);
      var decodeJson = jsonDecode(response.body);

      return PokeApi.fromJson(decodeJson);
    } catch (error) {
      print('Error when trying to fetch the Pokemon list.');
      return null;
    }
  }
}