import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      home:Hello()
    );
  }
  void changeHello(hello){

  }
}

class Hello extends StatefulWidget{
  const Hello({Key? key}) :super(key: key);
  @override 
  State<StatefulWidget> createState() => _Hello();
}

class _Hello extends State<Hello>{
  int item = 1;
  Color cor = Colors.red;
  Alignment ali = Alignment.center;
  String hello = "";
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: AnimatedContainer(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 1000),
        alignment: ali,
        child: Text(hello),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed:_changeHello,
        child:const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: "Left",
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: "Up",
            backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            label: "Down",
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: "Right",
            backgroundColor: Colors.blueAccent
          ),          
        ],
        onTap: _moveHello,
        currentIndex: item,
        ),
    );
  }
  void _changeHello(){
    if (hello == ""){
      hello = "hello world";
    }else{
      hello = "";
    }
    setState(() {});
  }
  void _moveHello(int index){
    item = index;
    switch(index){
      case 0:
        ali = Alignment.centerLeft;
        break;
      case 1:
        ali = Alignment.topCenter;
        break;
      case 2:
        ali = Alignment.bottomCenter;
        break;
      case 3:
        ali = Alignment.centerRight;
        break;
    }
    setState(() {
      
    });
  }
}