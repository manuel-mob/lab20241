


import 'dart:convert';

import 'package:ejemplo_lab/data/Holiday.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestFetchDataPage extends StatefulWidget {
  const TestFetchDataPage({super.key, required this.title});
  final String title;
  @override
  State<TestFetchDataPage> createState() {
    print('create state');
    return _TestFetchDataPagePageState();
  }
}
class _TestFetchDataPagePageState extends State<TestFetchDataPage> {
  int _counter = 0;
  int _selectedIndex = 0;
  Future<List<Holiday>>? _holidayFuture;
  List<Holiday> _holidayList = [];


  _TestFetchDataPagePageState() {
    print('constructor, mounted: $mounted');
  }

  @override
  void initState() {
    super.initState();
    _holidayFuture = initialization();
    
    print("initState() called.");
  }
  

  Future<List<Holiday>> initialization() async {
    final response = await http
      .get(Uri.parse('https://apis.digital.gob.cl/fl/feriados/2024'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonDecoded = jsonDecode(response.body) as List<dynamic>;
      return jsonDecoded.map((dynamic item) => Holiday.fromJson(item as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load holidays');
    }
  }

  List<Holiday> _buildHolidayList() {
    // Handle potential loading state (replace with actual error handling)
    if (_holidayFuture == null) {
      return []; // Or show an empty list message
    }
    _holidayFuture!.then((result) {
      for (var item in result) {
        _holidayList.add(item);
      }
    });
    return _holidayList;
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
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Ejemplo de Card'),
      //         selected: _selectedIndex == 0,
      //         onTap: () {
      //           // Update the state of the app
      //           //_onItemTapped(0);
      //           // Then close the drawer
                
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Lista'),
      //         selected: _selectedIndex == 1,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => ListDetail()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Lista de Jugadores'),
      //         selected: _selectedIndex == 7,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => ListPlayers(players: _players)));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Lista de Juegos'),
      //         selected: _selectedIndex == 8,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => ListGameScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Future - Ejemplo'),
      //         selected: _selectedIndex == 9,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => PracticeFutureScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Detalle'),
      //         selected: _selectedIndex == 2,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => Detail()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Sensores'),
      //         selected: _selectedIndex == 3,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => SensorsScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Gestos'),
      //         selected: _selectedIndex == 4,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => GesturesScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Persistencia'),
      //         selected: _selectedIndex == 5,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => GesturesScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Redes y http'),
      //         selected: _selectedIndex == 6,
      //         onTap: () {
      //           Navigator.push(context, 
      //           MaterialPageRoute(builder: (context) => GesturesScreen()));
      //         },
      //       ),
      //     ],
      //   )
      // ),
      body: 
        Center(
          child:
            FutureBuilder<List<Holiday>>(
          future: _holidayFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text("No data available");
            } else {
              return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                      final holiday = snapshot.data![index];
                        return ListTile(
                        title: Text(holiday.name),
                        onTap: () => _showHolidayDetails(holiday),
                      );
                    }
                );
            }
          },
        ),
    ),
    );
  
  }

  void _showHolidayDetails(Holiday holiday) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(holiday.name),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Avoid potential scrolling issues
          children: [
            Text('Comment: ${holiday.comment}'),
            Text('Date: ${holiday.date}'),
            Text('non Negotiable: ${holiday.nonNegotiable}'),
            Text('type: ${holiday.type}'),

          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }


  @override
  void didUpdateWidget(covariant TestFetchDataPage oldWidget) {
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

