import 'package:flutter/material.dart';
import 'package:pokedex/page_2.dart';
import 'package:pokedex/pokemon.dart';


class PokemonWidget extends StatelessWidget {

 final Pokemon? item;

  const PokemonWidget({Key? key, this.item}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(item: item!,)));
        },
        contentPadding: EdgeInsets.all(10),
        title: Text(item!.name!),
        leading: Image.network(item!.thumbnailImage!),
        trailing: Text('#${item!.number}', style: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}


