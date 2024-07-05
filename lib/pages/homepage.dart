import 'package:ejemplo_lab/data/Player.dart';
import 'package:ejemplo_lab/pages/gestures.dart';
import 'package:ejemplo_lab/pages/list_games.dart';
import 'package:ejemplo_lab/pages/practice_future_example.dart';
import 'package:ejemplo_lab/pages/sensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'detail.dart';
import 'list_detail.dart';
import 'list_players.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() {
    print('create state');
    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  Future<List<Player>>? _playersFuture;
  List<Player> _players = [];


  _MyHomePageState() {
    print('constructor, mounted: $mounted');
  }

  @override
  void initState() {
    super.initState();
    initialization();
    print("initState() called.");
    _playersFuture = Player.loadPlayers();
    _players = _buildPlayersList();
  }
  

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies() called.");
  }

  void _decrementCounter() {
    setState(() {
      print("set State -");
      _counter--;
    });
  }
  void _incrementCounter() {    
    setState(() {
      print("set State +");
      _counter++;
    });
  }
  void _resetCounter() {
    setState(() {
      print("set State 0");
      _counter = 0;
    });
  }

  



  @override
  Widget build(BuildContext context) {
    print("build() called.");
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Ejemplo de Card'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                //_onItemTapped(0);
                // Then close the drawer
                
              },
            ),
            ListTile(
              title: const Text('Lista'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ListDetail()));
              },
            ),
            ListTile(
              title: const Text('Lista de Jugadores'),
              selected: _selectedIndex == 7,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ListPlayers(players: _players)));
              },
            ),
            ListTile(
              title: const Text('Lista de Juegos'),
              selected: _selectedIndex == 8,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ListGameScreen()));
              },
            ),
            ListTile(
              title: const Text('Future - Ejemplo'),
              selected: _selectedIndex == 9,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => PracticeFutureScreen()));
              },
            ),
            ListTile(
              title: const Text('Detalle'),
              selected: _selectedIndex == 2,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Detail()));
              },
            ),
            ListTile(
              title: const Text('Sensores'),
              selected: _selectedIndex == 3,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SensorsScreen()));
              },
            ),
            ListTile(
              title: const Text('Gestos'),
              selected: _selectedIndex == 4,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => GesturesScreen()));
              },
            ),
            ListTile(
              title: const Text('Persistencia'),
              selected: _selectedIndex == 5,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => GesturesScreen()));
              },
            ),
            ListTile(
              title: const Text('Redes y http'),
              selected: _selectedIndex == 6,
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => GesturesScreen()));
              },
            ),
          ],
        )
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
                            Text("$_counter",
                              style: Theme.of(context).textTheme.labelLarge),
                            Center(    
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: _incrementCounter, child: Text("+")),
                                  SizedBox(width: 20),
                                  ElevatedButton(onPressed: _resetCounter, child: Text("Reset")),
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
    );
  }


  List<Player> _buildPlayersList() {
    // Handle potential loading state (replace with actual error handling)
    if (_playersFuture == null) {
      return []; // Or show an empty list message
    }
    _playersFuture!.then((result) {
      for (var item in result) {
        _players.add(item);
      }
    });
    return _players;
  }
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget , mounted: $mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose, mounted: $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble, mounted: $mounted');
  }
}

