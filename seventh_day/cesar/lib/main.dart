import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key:key);
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
  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  final _controlerOne = TextEditingController();
  final _controlerTwo = TextEditingController();
  bool trans = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _controlerOne,
                maxLines: 4,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10)
                  ),
                ),
                focusNode: focus1,
                onTap: (() {
                  if(focus1.hasFocus){
                    FocusScope.of(context).unfocus();
                  }
                }),
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed:(){
                      setState(() {
                        FocusScope.of(context).unfocus();
                        String aux = _controlerOne.text;
                        _controlerOne.text = _controlerTwo.text;
                        _controlerTwo.text = aux;
                      });
                    },
                    icon:const Icon(Icons.rotate_left_rounded),
                    label:const Text("trocar"),
                    ),
                    OutlinedButton(
                      onPressed:cesar,
                      child: const Text("confrimar")
                    ),
                    Tooltip(
                      message: "traduzir",
                      child: Checkbox(
                        value: trans, 
                        onChanged:(bool? value){
                          setState(() {
                            FocusScope.of(context).unfocus();
                            trans = value ?? false;
                          });
                        }),
                    )
                ],
              ),
              TextFormField(
                focusNode: focus2,
                controller: _controlerTwo,
                maxLines: 4,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10)
                  ),
                ),
                onTap: (() {
                  if(focus2.hasFocus){
                    FocusScope.of(context).unfocus();
                  }
                }),
              ),
            ],
          ),
        )
      ),
    );
  }
  void cesar(){
    List<String> abc = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    String raw = _controlerOne.text;
    String translate = "";
    if(!(trans)){
      for(int x = 0;x < raw.length;x++){
        for(int y = 0;y < abc.length;y++){
          if(raw[x] == abc[y]){
            translate += abc[(y+3)%26];
          }
        }
      }
    }else{
      for(int x = 0;x < raw.length;x++){
        for(int y = 0;y < abc.length;y++){
          if(raw[x] == abc[y]){
            translate += abc[(y+23)%26];
          }
        }
      }
    }
    _controlerTwo.text = translate;
    FocusScope.of(context).unfocus();
  }
}