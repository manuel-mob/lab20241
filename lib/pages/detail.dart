import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: const Text("Detail"),
      ),
      body: Column(
        children: [
          Text("Hola"),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }
          , child: Text("Volver"))
        ],
      ),
      );

  }
}
