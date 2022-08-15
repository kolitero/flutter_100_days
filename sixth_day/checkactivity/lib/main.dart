import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
  ));
}

List<Widget> itens = [
];


class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      home:Home()
    );
  }
}

class Home extends StatefulWidget{
  const Home({Key? key}):super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text("tarefas"),
        actions:[
          IconButton(
            icon:const Icon(Icons.add),
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageAddItem() ));
            }
          ),
        ],
      ),
      body:ListView(
        children: itens,
      )
    );
  }
}

class PageAddItem extends StatefulWidget{
  const PageAddItem({Key? key}) :super(key: key);
  @override 
  State<StatefulWidget> createState() => _PageAddItem(); 
}

class _PageAddItem extends State<PageAddItem>{
  final tarefa = TextEditingController();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top:20,bottom: 5,left: 5,right: 5),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text("adicionar tarefa"),
            ),
            const Divider(
              color: Colors.black,
            ),
            TextFormField(
              controller: tarefa,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "nome da tarefa"
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed:Navigator.of(context).pop,
                  child:const Text("voltar"),
                  ),
                const VerticalDivider(),
                OutlinedButton(
                  onPressed:(){
                    setState(() {
                      itens.add(
                        Item(name: tarefa.text)
                      );
                    });
                  },
                  child:const Text("adicionar"),
                  ),
              ],
            ),
          ],
        ),
      )
    );
  }
}

class Item extends StatefulWidget{
  final String name;
  const Item({Key? key,required this.name}):super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool value = false;
  @override 
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.name),
        Checkbox(
          value: value,
          onChanged: (bool? val) {
            setState(() {
              value = !(value);
            });
          }
          )
      ],
    );
  }
}