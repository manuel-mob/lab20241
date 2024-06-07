import 'package:flutter/material.dart';

class SensorsScreen extends StatelessWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: const Text("Sensors Screen"),
      ),
      body:
          Center(
            child: Column(children: [
              SizedBox(height: 20,),
              Text("Sensors Screen")
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
