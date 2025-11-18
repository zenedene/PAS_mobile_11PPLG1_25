import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pas_mobile_11pplg1_25/models/store_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, product_id INTEGER UNIQUE, title TEXT, price REAL, image TEXT, data TEXT)',
        );
      },
    );
  }

  Future<int> insertFavorite(TableModelStore product) async {
    final client = await db;
    final map = {
      'product_id': product.id,
      'title': product.title,
      'price': product.price,
      'image': product.image,
      'data': jsonEncode(product.toJson()),
    };
    return client.insert(
      'favorites',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteFavorite(int productId) async {
    final client = await db;
    return client.delete(
      'favorites',
      where: 'product_id = ?',
      whereArgs: [productId],
    );
  }

  Future<Map<String, dynamic>?> getFavoriteRowByProductId(int productId) async {
    final client = await db;
    final rows = await client.query(
      'favorites',
      where: 'product_id = ?',
      whereArgs: [productId],
      limit: 1,
    );
    if (rows.isNotEmpty) return rows.first;
    return null;
  }

  Future<List<TableModelStore>> getFavorites() async {
    final client = await db;
    final rows = await client.query('favorites', orderBy: 'id DESC');
    return rows.map((r) {
      final data = r['data'] as String?;
      if (data != null && data.isNotEmpty) {
        return TableModelStore.fromJson(jsonDecode(data));
      }

      return TableModelStore(
        id: (r['product_id'] as num).toInt(),
        title: r['title'] as String? ?? '',
        price: (r['price'] as num?)?.toDouble() ?? 0.0,
        description: '',
        category: Category.ELECTRONICS,
        image: r['image'] as String? ?? '',
        rating: Rating(rate: 0.0, count: 0),
      );
    }).toList();
  }
}
