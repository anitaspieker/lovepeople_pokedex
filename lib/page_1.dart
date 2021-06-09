import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pokeList = [];

  bool load = true;

  @override
  void initState() {
    loadPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
       actions: [
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.all(10),
            child: Image.network(
               'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'
               ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: ListView.builder(
              itemCount: pokeList.length,
              itemBuilder: (context, index) {
                return PokemonWidget(
                  item: pokeList[index],
                );
              },
            ),
          ),
          if (load) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void loadPokemon() {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    http.get(url).then((response) {
      setState(() {
        load = true;
      });
      if (response.statusCode == 200) {
        Map json = JsonDecoder().convert(response.body);

        setState(() {
          pokeList = json['data'].map<Pokemon>((item) {
            return Pokemon.fromJson(item);
          }).toList();
        });
      }
      setState(() {
        load = false;
      });
    });
  }
}


