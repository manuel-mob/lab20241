import 'package:ejemplo_lab/data/Player.dart';
import 'package:flutter/material.dart';

class ListPlayers extends StatelessWidget {
  final List<Player> players;
  

  const ListPlayers({Key? key, required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player List'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            title: Text(player.name),
            subtitle: Text('Description: ${player.description}'),
            onTap: () {
              showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(player.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min, // Avoid potential scrolling issues
                          children: [
                            Text('Description: ${player.description}'),
                            // if (player.otherAttribute1 != null) // Check for null before accessing
                            //   Text('Other Attribute 1: ${player.otherAttribute1}'),
                            // if (player.otherAttribute2 != null) // Check for null before accessing
                            //   Text('Other Attribute 2: ${player.otherAttribute2}'),
                            // // ... Add more attributes as needed
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
            ,
          );
        },
      ),
    );
  }
}