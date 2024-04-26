import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {
  const ListDetail({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: const Text("List"),
      ),
      body:
          ListView(

            padding: const EdgeInsets.all(20.0),
            children: const <Widget>[
              Text("Item 1"),
              Text("Item 2"),
              Text("Item 3"),
              Text("Item 4"),
            ],
          ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Volver"))
      ], 
      /*Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }
          , child: Text("Volver")),
          /*ListView(
            children: const <Widget>[
              Text("Hola"),
              Text("Chao"),
              Text("Nos vemos")
            ],
          )*/
        ],
      ),*/
      );
  }
}
