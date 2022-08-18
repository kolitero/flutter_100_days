import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _controller = TextEditingController();
  List<double> list= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children:[
            Wrap(
              direction: Axis.vertical,
              children: createlist(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: TextFormField(
                      controller: _controller,
                      decoration:const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey
                          )
                        )
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: (){
                      double? value = double.tryParse(_controller.text);
                      if(value != null){
                        value = double.parse(value.toStringAsFixed(2));
                        list.add(value);
                      }
                      setState(() {
                        
                      });
                    },
                    child:const Icon(Icons.add),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
  List<Widget> createlist(){
    List<Widget> widgets = [];
    for(double x in list){
      widgets.add(
        Container(
          height: 25,
          width: 75,
          decoration: BoxDecoration(
            border:Border.all(
              width: 0.5
            )
          ),
          child: Text(r"R$:"+x.toString())
          )
        );
    }
    return widgets;
  }
}