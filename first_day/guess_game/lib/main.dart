import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:GuessGame(),
      title: "guess game",
    );
  }
}

class GuessGame extends StatefulWidget{
  const GuessGame({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() => _GuessGame();
}

class _GuessGame extends State<GuessGame>{
  final startControl= TextEditingController(text:"0");
  final endControl = TextEditingController(text:"10");
  final playercontrol = TextEditingController(); 
  int startNumber = 0;
  int endNumber = 10;
  int number = Random().nextInt(10);
  String result = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("guess game"),
        actions: <Widget>[
          IconButton(
            onPressed:(){
              showDialog(
              context: context,
               builder:(BuildContext context){
                return AlertDialog(
                  title:const Text("altearar valores"),
                  content: SafeArea(
                    child: ListView(
                      children: <Widget>[
                        TextField(
                          controller: startControl,
                        ),
                        TextField(
                          controller: endControl,
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: (){
                        startNumber = int.parse(startControl.text);
                        endNumber = int.parse(endControl.text);
                        setState(() {
                          if (endNumber-startNumber-1 <= 0){
                            startNumber = 0;
                            endNumber = 10;
                          }
                          number = Random().nextInt(endNumber-startNumber)+startNumber;
                          Navigator.pop(context);
                        });
                      },
                      icon: const Icon(Icons.play_arrow)
                      ),
                  ],
                );
               }
               );
            },
            icon:const Icon(Icons.adjust)
            ),
        ],
      ),
      body:Center(
        child:Column(
          children: <Widget>[
            Container(
              padding:const EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text("min $startNumber"),
              ),
            Container(
            padding:const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            child: Text("max:$endNumber"),
            ),
            TextField(
              controller: playercontrol,

            ),
            TextButton(
              child:const Text("press"),
              onPressed: (){
                setState(() {
                  if (playercontrol.text == number.toString()){
                    result = "ganhou";
                    number = Random().nextInt(endNumber-startNumber)+startNumber;
                    }
                  else{
                    result = "errado";
                  }
                  playercontrol.clear();
                });
              },
            ),
            Text(result)
          ],
        ),
        )
    );
  }
  
}


