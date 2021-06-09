import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon? item;

  const PokemonPage({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(item!.name);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      width: 400,
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.brown[50],
                        child: Image.network(
                          item!.thumbnailImage!,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(38),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text('#' + item!.number!),),),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: Text(
                      item!.description!,
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Tipo:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      item!.type!.join('  '),
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Fraquezas:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      item!.weakness!.join('  '),
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
