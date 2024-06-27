import 'package:ejemplo_lab/data/Game.dart';
import 'package:sqflite/sqflite.dart';

class GameDatabaseHelper {
  // Define a private constructor to prevent instantiation from outside
  GameDatabaseHelper._privateConstructor();

  static final GameDatabaseHelper instance = GameDatabaseHelper._privateConstructor();

  static const _databaseName = 'example_database.db';
  static const _databaseVersion = 3;

  // Function to open the database (or create it if it doesn't exist)
  Future<Database> get database async {
    final databasePath = await getDatabasesPath();
    print('The versions in _databaseVersion is $_databaseVersion');
    return await openDatabase(
      '$databasePath/$_databaseName',
      onCreate: (db, version) {
        // Create the "game" table on database creation
        print('The versions in version is $version');
        db.execute('''
          CREATE TABLE game(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT,
            gender TEXT,
            year INTEGER,
            version INTEGER),
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async  {
        // Handle database schema upgrades if needed
        // (implement logic for updating existing tables here)
        print('The versions in oldVersion is $oldVersion and newVersion is $newVersion');
        for (int version = oldVersion + 1; version <= newVersion; version++) {
          
          switch (version) {
            case 3:
              // Create a new table with the desired AUTOINCREMENT column
              print('The version is ${version} and Create a new table with the desired AUTOINCREMENT column');
              await db.execute('''
                CREATE TABLE game_new(
                  id INTEGER PRIMARY KEY AUTOINCREMENT, 
                  name TEXT,
                  gender TEXT,
                  year INTEGER,
                  version INTEGER)
              ''');

              // Migrate data from the old table to the new table
              final oldData = await db.query('game');
              for (final row in oldData) {
                await db.insert('game_new', row);
              }

              // Drop the old table after successful migration
              await db.execute('DROP TABLE game');

              // Rename the new table to the original name
              await db.execute('ALTER TABLE game_new RENAME TO game');
              break;
            default:
              throw Exception('Unsupported upgrade version: $version');
          }
        }
      },  
      version: 3,//This version is for determinate the OnCreate, onUpgrade or onDowngrade option. (new version)
    );
  }

  //Fcution to insert game
  Future<void> insertGame(Game game) async {
    final database = await GameDatabaseHelper.instance.database;
    await database.insert(
      'game',
      game.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Function to get all Games
  Future<List<Game>> getGames() async {
    final database = await GameDatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await database.query('game');
    return List.generate(maps.length, (i) => Game.fromMap(maps[i]));
  }

  //Pending Delete, Update.
  //References
  /* 
    https://pub.dev/packages/sqflite
    https://docs.flutter.dev/cookbook/persistence/sqlite
    https://medium.com/@beccasaka/using-sqlite-in-flutter-3d5a10138090
  
  */

}
