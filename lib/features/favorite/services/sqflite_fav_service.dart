import 'package:restoku_app/features/favorite/models/fav_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

class SqliteService {
  static const String _databaseName = 'favorites.db';
  static const String _favoriteTable = 'favorite_restaurants';
  static const int _version = 1;

  Future<Database> _initializeDb() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, _databaseName);

    return openDatabase(
      path,
      version: _version,
      onCreate: (Database database, int version) async {
        await database.execute(
          """CREATE TABLE $_favoriteTable(
            id TEXT PRIMARY KEY,   -- Menggunakan TEXT karena ID dari API adalah String
            name TEXT NOT NULL,
            city TEXT NOT NULL,
            imageUrl TEXT NOT NULL,
            rating REAL NOT NULL
          )""",
        );
      },
    );
  }

  Future<void> insertFavorite(FavoriteRestaurant restaurant) async {
    try {
      final db = await _initializeDb();
      await db.insert(
        _favoriteTable,
        restaurant.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    // ignore: empty_catches
    } catch (e) {
    
    }
  }

  Future<List<FavoriteRestaurant>> getAllFavorites() async {
    try {
      final db = await _initializeDb();
      final results = await db.query(_favoriteTable, orderBy: "name");

      return results
          .map((result) => FavoriteRestaurant.fromJson(result))
          .toList();
    } catch (e) {
     
      return [];
    }
  }

  Future<bool> isFavorite(String id) async {
    try {
      final db = await _initializeDb();
      final results = await db.query(
        _favoriteTable,
        where: "id = ?",
        whereArgs: [id],
        limit: 1,
      );
      return results.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<void> removeFavorite(String id) async {
    try {
      final db = await _initializeDb();
      await db.delete(_favoriteTable, where: "id = ?", whereArgs: [id]);
      // ignore: empty_catches
    } catch (e) {}
  }
}
