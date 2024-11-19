import 'dart:async';
import 'package:pas/Model/GetModel2.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class animes {
  final String strTeam;
  final String strLeague;
  final String strBadge;

  animes({
    required this.strTeam,
    required this.strLeague,
    required this.strBadge,
  });

  factory animes.fromJson(Map<String, dynamic> json) {
    return animes(
      strTeam: json['strTeam'],
      strLeague: json['strLeague'],
      strBadge: json['strBadge'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'strTeam': strTeam,
      'strLeague': strLeague,
      'strBadge': strBadge,
    };
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('anime.db'); 
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const animeTable = '''
      CREATE TABLE favorites (
        strTeam TEXT PRIMARY KEY,
        strLeague TEXT NOT NULL,
        strBadge TEXT NOT NULL
      )
    '''; 

    await db.execute(animeTable);
  }

  Future<void> addFavorite(PostModel anime) async {
    final db = await instance.database;
    await db.insert('favorites', {
      'strTeam': anime.strTeam,
      'strLeague': anime.strLeague,
      'strBadge': anime.strBadge,
    });
  }

  Future<List<PostModel>> getFavorites() async {
    final db = await instance.database;
    final result = await db.query('favorites');
    return result
        .map((map) => PostModel(
              strTeam: map['strTeam'] as String,
              strLeague: map['strLeague'] as String,
              strBadge: map['strBadge'] as String,
            ))
        .toList();
  }

  Future<void> removeFavorite(String idTeam) async {
    final db = await instance.database;
    await db.delete('favorites', where: 'idTeam = ?', whereArgs: [idTeam]);
  }

  Future<bool> checkFavorite(String idTeam) async {
    // Ubah parameter menjadi id
    final db = await instance.database;
    final maps = await db.query(
      'favorites',
      where: 'idTeam = ?',
      whereArgs: [idTeam],
    );
    return maps.isNotEmpty;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
