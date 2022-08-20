import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home:Scaffold(
        body: Center(
          child:Dice()
        ),
      )
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return chose();
  }
  Widget chose(){
    int value = Random().nextInt(7);
    switch(value){
      case 1:
        return Image.network("https://img1.gratispng.com/20180413/blq/kisspng-yahtzee-one-dice-3d-free-playing-die-set-clip-art-dice-5ad07fe8545d11.4008243615236136723456.jpg");;
      case 2:
        return Image.network("https://e7.pngegg.com/pngimages/379/372/png-clipart-dice-bunco-four-sided-die-dominoes-number-two-game-white.png");
      case 3:
        return Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqbN2FyQ-sc38kvsxWheQ4J2ke4eV21lyXSurmFFpKqJ88I6RsbxdLqOqMcTfmS1qzG7o&usqp=CAU");
      case 4: 
        return Image.network("https://www.pinclipart.com/picdir/middle/25-251129_die-clipart.png");
      case 5:
        return Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfTnZWZMEhsHBHoeCwheiWMy9_5vDwVEdlBMQYkaRWhL1hzGuHrrPj0S8U2sNC07kkrvc&usqp=CAU");
      case 6:
        return Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR28hQa9qOiu1HGsq9nwMwq8tuNijXjAFad6q69xnOyJGmpnxRndTJukF80u1DAK9EOHKM&usqp=CAU");
    } 
  return const  Text("");
  }
}