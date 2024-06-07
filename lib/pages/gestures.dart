import 'package:flutter/material.dart';

class GesturesScreen extends StatelessWidget {
  const GesturesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: const Text("Gestures Screen"),
      ),
      body:
          Center(
            child: Column(children: [
              SizedBox(height: 20,),
              Text("Gesture")
            ],),
          ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Volver"))
      ], 
      );
  }
}
