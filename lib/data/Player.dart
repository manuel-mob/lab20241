import 'dart:convert';

import 'package:flutter/services.dart';

class Player {
  final int id;
  final String name;
  final String? description;

  const Player({required this.id, required this.name, this.description});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  static Future<List<Player>> loadPlayers() async {
    final jsonString = await rootBundle.loadString('assets/json/players.json');
    final List<dynamic> jsonDecoded = jsonDecode(jsonString) as List<dynamic>;
    print("test----:"+jsonDecoded.toString());
    return jsonDecoded.map((dynamic item) => Player.fromJson(item as Map<String, dynamic>)).toList();
  }

}


