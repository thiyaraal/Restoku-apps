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

  /// **📌 Tambahkan restoran ke favorit**
  Future<void> insertFavorite(FavoriteRestaurant restaurant) async {
    try {
      final db = await _initializeDb();
      await db.insert(
        _favoriteTable,
        restaurant.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
     print("Error inserting favorite: $e");
    }
  }

  /// **📌 Ambil semua restoran favorit dari database**
  Future<List<FavoriteRestaurant>> getAllFavorites() async {
    try {
      final db = await _initializeDb();
      final results = await db.query(_favoriteTable, orderBy: "name");

      return results.map((result) => FavoriteRestaurant.fromJson(result)).toList();
    } catch (e) {
     print("Error fetching favorites: $e");
      return [];
    }
  }

  /// **📌 Cek apakah restoran sudah ada di daftar favorit**
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
     print("Error checking favorite: $e");
      return false;
    }
  }

  /// **📌 Hapus restoran dari daftar favorit**
  Future<void> removeFavorite(String id) async {
    try {
      final db = await _initializeDb();
      await db.delete(_favoriteTable, where: "id = ?", whereArgs: [id]);
    } catch (e) {
     print("Error removing favorite: $e");
    }
  }
}
