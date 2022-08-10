import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:GuessGame(key:key),
      color: Colors.black87,
      title: "guess game",
    );
  }
}

class GuessGame extends StatefulWidget{
  const GuessGame({super.key});

  @override
  State<StatefulWidget> createState() => _GuessGame();
}

class _GuessGame extends State<GuessGame>{
  final startControl= TextEditingController(text:"0");
  final endControl = TextEditingController(text:"10");
  final playercontrol = TextEditingController(); 
  

  @override
  Widget build(BuildContext context){
    int startNumber = int.parse(startControl.text);
    int endNumber = int.parse(endControl.text);
    if (endNumber-startNumber-1 <= 0){
      startNumber = 0;
      endNumber = 10;
    }
    int number = Random().nextInt(endNumber-startNumber)+startNumber;
    String result = "";
    if (playercontrol.text == number.toString()){
      result = "ganhou";
    }
    else{
      result = "";
    }
     
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
            Text("min $startNumber"),
            Text("max:$endNumber"),
            TextField(
              controller: playercontrol,
            ),
            TextButton(
              child:const Text("press"),
              onPressed: (){
                setState(() {
                  
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


