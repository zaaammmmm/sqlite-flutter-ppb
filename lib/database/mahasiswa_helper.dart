import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';
import '../models/mahasiswa.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (kIsWeb) {
      // Use the web-compatible sqflite factory (IndexedDB under the hood).
      databaseFactory = databaseFactoryFfiWeb;
      return await databaseFactory.openDatabase(
        'mahasiswa.db',
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _onCreate,
        ),
      );
    }

    // On desktop (Linux/Mac/Windows) use FFI for sqflite.
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    String path = join(await getDatabasesPath(), 'mahasiswa.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mahasiswa(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        nim TEXT,
        jurusan TEXT
      )
    ''');
  }

  Future<int> insertMahasiswa(Mahasiswa mahasiswa) async {
    Database db = await database;
    return await db.insert('mahasiswa', mahasiswa.toMap());
  }

  Future<int> updateMahasiswa(Mahasiswa mahasiswa) async {
    Database db = await database;
    return await db.update(
      'mahasiswa',
      mahasiswa.toMap(),
      where: 'id = ?',
      whereArgs: [mahasiswa.id],
    );
  }

  Future<int> deleteMahasiswa(int id) async {
    Database db = await database;
    return await db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('mahasiswa');
    return List.generate(maps.length, (i) => Mahasiswa.fromMap(maps[i]));
  }
}
