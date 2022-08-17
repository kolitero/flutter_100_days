import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  bool blue = false;
  List<Widget> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: items,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            count += 1;
            if(blue){
              items.insert(0,Block(Colors.black,count));
              blue = false;
            }else{
              items.insert(0,Block(Colors.white,count));
              blue = true;
            }
          });
        },
      ),
    );
  }
}



class Block extends StatelessWidget{
  final Color cor;
  final int num;
  const Block(this.cor,this.num,{Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context) {
    Color? word;
    if(cor == Colors.black){
      word = Colors.white;
    }else{
      word = Colors.black;
    }
    return Container(
      alignment: Alignment.center,
      margin:const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/10,
      color: cor,
      child: Text(
        "blcok $num",
        style: TextStyle(
          color: word
        ),
        ),
    );
  }
}