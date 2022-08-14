import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context){
    return const  MaterialApp(
      home:MyHome()
    );
  }
}



class MyHome extends StatefulWidget{
  const MyHome({Key? key}):super(key: key);
  @override 
  State<StatefulWidget> createState() => _MyHome();
}

class _MyHome extends State<MyHome>{
  final imageSearc = TextEditingController(); 
  String imageUrl = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/778.png";
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:(){
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    content: TextField(
                      controller: imageSearc,
                    ),
                    actions: [
                      IconButton(
                        onPressed:(){
                          setState(() {
                            imageUrl = imageSearc.text;
                          });
                          Navigator.of(context).pop();
                        },
                        icon:const Icon(Icons.circle)
                        )
                    ],
                  );
                }
                );
            },
            icon:const Icon(Icons.link)
            )
        ],
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}