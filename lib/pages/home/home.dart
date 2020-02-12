import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon_app/constants/consts.dart';
import 'package:pokemon_app/models/pokeapi.dart';
import 'package:pokemon_app/stores/pokeapi_store.dart';
import 'package:pokemon_app/widgets/app_bar_top/app_bar_top.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(250 / 6),
            left: screenWidth - (250 / 1.55),
            child: Opacity(
              child: Image.asset(
                Consts.darkPokeball,
                height: 250,
                width: 250,
              ),
              opacity: 0.05,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                AppBarTop(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        PokeApi _pokeApi = pokeApiStore.pokeApi;
                        return (_pokeApi != null)
                          ? ListView.builder(
                            itemCount: _pokeApi.pokemon.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  _pokeApi.pokemon[index].name
                                ),
                              );
                            },
                          )
                          : Center(child: CircularProgressIndicator());
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
