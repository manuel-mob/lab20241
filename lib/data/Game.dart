class Game {
  final int? id;
  final String name;
  final String gender;
  final int year;
  final int version;

  const Game({
    this.id,
    required this.name,
    required this.gender,
    required this.year,
    required this.version,
  });

  // Convert a Game into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'year': year,
      'version': version,
    };
  }

  static Game fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as int, // Cast to int for type safety
      name: map['name'] as String, // Cast to String for type safety
      gender: map['gender'] as String, 
      year: map['year'] as int, 
      version: map['version'] as int, 
    );
  }

  // Implement toString to make it easier to see information about
  // each game when using the print statement.
  @override
  String toString() {
    return 'Game{id: $id, name: $name, gender: $gender, year: $year, version: $version}';
  }


}