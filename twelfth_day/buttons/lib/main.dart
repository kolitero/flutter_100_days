import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SwitchButton(),
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    int random =  Random().nextInt(3);
    switch (random) {
      case 0:
        return TextButton(
          onPressed:(() => setState(() {})),
          child:const Text("textbutton")
          );
      case 1:
        return OutlinedButton(
          onPressed:(() => setState(() {})),
          child:const Text("outlinedbutton")
          );
      case 2:
        return IconButton(
          onPressed:(() => setState(() {})),
          icon:const Icon(Icons.abc)
          );
      default:
        return const Text("wtf");
    }
  }
}