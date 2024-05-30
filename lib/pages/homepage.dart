import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'detail.dart';
import 'list_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Color firstColor = Colors.orange;
  Color secondColor = Colors.purple;

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _incrementCounter() {    
    setState(() {

    });
  }
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: Text(widget.title),
      ),
      body: 
      Center(
        widthFactor: 6,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 5,
                child: 
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Color name',
                                style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.amber,
                              height: 50,
                              width: 50,
                            ),
                            Center(    
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: _incrementCounter, child: Column(
                                    children: [
                                      Container(
                                        color: firstColor,
                                        width: 100,
                                        height: 30,),
                                      Text("Color Name")
                                    ]
                                  )),
                                  SizedBox(width: 20),
                                  ElevatedButton(onPressed: _resetCounter, child: Column(
                                    children: [
                                      Container(
                                        color: secondColor,
                                        width: 100,
                                        height: 30,),
                                      Text("Color Name")
                                    ]
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(onPressed:  () {
                                      Navigator.push(context, MaterialPageRoute(builder: ((context) => ListDetail())));
                                    }, child: Column(children: [Icon(Icons.list),Text("Lista")],)),
        ElevatedButton(onPressed:  () {
                                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Detail())));
                                    }, child: Column(children: [Icon(Icons.document_scanner),Text("Detalle")],)),
        
      ],
      
    );
  }
}

