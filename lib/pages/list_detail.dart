import 'package:flutter/material.dart';

import '../data/Player.dart';

class ListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = ['Item1','Nombre2','Texto3'];
    print("Build List");
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: const Text("List"),
      ),
      body:
    //   ListView.builder(
    //   itemCount: routes.length,
    //   itemBuilder: (context, index) {
    //     final route = routes[index];
    //     return Text('${route.name} - ${route.description}'); // Display route information
    //   },
    // ),
          ListView(

            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              for (var pair in items) 
                Text(pair)
                //Text('${pair.name} - ${pair.description}')
            ],
          ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Volver"))
      ], 
      );
  }
}
