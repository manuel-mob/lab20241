import 'package:ejemplo_lab/data/Game.dart';
import 'package:ejemplo_lab/utils/GameDatabaseHelper.dart';
import 'package:flutter/material.dart';

class ListGameScreen extends StatefulWidget {
  const ListGameScreen({super.key});

  @override
  _ListGameScreenState createState() => _ListGameScreenState();
}

class _ListGameScreenState extends State<ListGameScreen> {
  Future<List<Game>>? _gamesFuture;
  final TextEditingController _gameNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _gamesFuture = GameDatabaseHelper.instance.getGames();
  }

  @override
  void dispose() {
    _gameNameController.dispose();
    super.dispose();
  }

  Future<void> _insertNewGame(String name) async {
    
    final game = Game(
      name: name,
      gender: "Test",
      year: 2024,
      version: 1
    );
    await GameDatabaseHelper.instance.insertGame(game);
    _gamesFuture = GameDatabaseHelper.instance.getGames(); // Refresh data
    setState(() {}); // Rebuild the UI with the updated list
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddGameDialog,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Game>>(
        future: _gamesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Handle errors
          } else {
            final games = snapshot.data!; // Access the list of games
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return ListTile(
                  title: Text(game.name),
                  subtitle: Text('Description: ${game.gender}'),
                  onTap: () => _showGameDetails(game), // Call function to show details
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showAddGameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Game'),
        content: TextField(
          controller: _gameNameController,
          decoration: const InputDecoration(labelText: 'Game name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = _gameNameController.text.trim();
              if (name.isNotEmpty) {
                _insertNewGame(name);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showGameDetails(Game game) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(game.name),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Avoid potential scrolling issues
          children: [
            Text('Gender: ${game.gender}'),
            Text('Year: ${game.year}'),
            Text('Version: ${game.version}'),

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
}
