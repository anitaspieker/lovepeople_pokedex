import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemon_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({ Key? key, this.item }) : super(key: key);

  final Pokemon? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item!.name!),
      ),
      body: PokemonPage(item: item,),
    );
  }
}