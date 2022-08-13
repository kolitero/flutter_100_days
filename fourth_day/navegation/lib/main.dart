import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      home:PageOne(),
    );
  }
}

class PageOne extends StatelessWidget{
  const PageOne({Key? key}):super(key: key);
  final int value = 0;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body:const Center(
        child: Icon(Icons.photo),
      ),
      bottomNavigationBar: MyNavigation(value),
    );
  }
}

class PageSecond extends StatelessWidget{
  const PageSecond({Key? key}):super(key:key);
  final int value = 1;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body:const Center(
        child: Icon(Icons.person),
      ),
      bottomNavigationBar: MyNavigation(value),
    );
  }
}

class PageThird extends StatelessWidget{
  const PageThird({Key? key}):super(key:key);
  final int  value = 2;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body:const Center(
        child: Icon(Icons.phone),
      ),
      bottomNavigationBar: MyNavigation(value),
    );
  }
}

class MyNavigation extends StatelessWidget{
  final int index;
  const MyNavigation(this.index,{Key? key,}):super(key: key);
  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
          backgroundColor: Colors.blue,
          label: "One"
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          backgroundColor: Colors.green,
          label: "Second"
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          backgroundColor: Colors.red,
          label: "third"
          ),
      ],
      currentIndex: index,
      onTap:(int value){
        if (value == index){
          return;
        }
        switch (value) {
          case 0:
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: ((context) => const PageOne()
            )));
            break;
          case 1:
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: ((context) => const PageSecond()
            )));
            break;
          case 2:
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: ((context) => const PageThird()
            )));
            break;
        }
      },
    );
  }
}