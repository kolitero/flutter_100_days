import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      home:HomePage(),
   );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key: key);
  @override 
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  bool number = false;
  bool sybol = false;
  double passwordLenght = 4;
  String password = "";
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child: Column(
          children: <Widget>[
            SelectableText(password),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Row(
                children: <Widget>[
                  const Text("lenght"),
                  Expanded(
                    child: Slider(
                      value: passwordLenght,
                      label: passwordLenght.round().toString(),
                      divisions: 20,
                      onChanged:(double value){
                        setState(() {
                          passwordLenght = value;
                        });
                      },
                      min: 4,
                      max: 24,
                      ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("numeros"),
                  Checkbox(
                    value: number,
                    onChanged: (bool? value){
                      setState(() {
                        number = value ?? number;
                      });
                    },
                  ),
                  const Text("symbol"),
                  Checkbox(
                    value: sybol,
                    onChanged: (bool? value){
                      setState(() {
                        sybol = value ?? sybol;
                      });
                    }
                    ),
              ],
            ),
            TextButton(
              onPressed: generatePassword,
              child:const Text("confirmar"),
            )
          ],
        ),
      )
    );
  }
  void generatePassword(){
    List<String> pass = [];
    List<String> abc = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    List<String> numbers = ["0","1","2","3","4","5","6","7","8","9"];
    List<String> sybols = ["@","#"];
    String word = ""; 
    int chars = 26;
    if(number){
      chars += 10;
      abc.addAll(numbers);
    }
    if(sybol){
      chars += 2;
      abc.addAll(sybols);
    }
    for(int x = 0;x < passwordLenght;x++){
      int random = Random().nextInt(chars);
      pass.add(abc[random]);
    }
    int? randomn;
    if(number){
      int randomn = Random().nextInt(passwordLenght.round());
      pass[randomn] = numbers[randomn%10];
    }
    int? randoms;
    if(sybol){
      do{
        int randoms = Random().nextInt(passwordLenght.round());
        pass[randoms] = sybols[(randomn ?? 4)%4];
      }while(randoms  == (randomn ?? ""));
    }
    for(int x = 0;x < passwordLenght;x++){
      word += pass[x];
    }
    setState(() {
        password = word;
      });
  }
}