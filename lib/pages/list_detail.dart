import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {
  const ListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Item1','Nombre2','Texto3'];

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
            children: <Widget>[
              for (var pair in items)
              Text(pair)
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
