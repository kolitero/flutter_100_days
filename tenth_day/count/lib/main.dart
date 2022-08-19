import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => setState(() {count--;}),
              icon:const Icon(Icons.remove)
            ),
            Text(count.toString()),
            IconButton(
              onPressed: () => setState(() {count++;}),
              icon:const Icon(Icons.add)
              )
          ],
        ),
      )
    );
  }
}