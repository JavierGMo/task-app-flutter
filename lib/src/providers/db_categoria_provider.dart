import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/src/models/categoria_model.dart';


class DBCategoriaProvider{

  static Database _database;
  static final DBCategoriaProvider db = DBCategoriaProvider._();
  
  DBCategoriaProvider._();

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async {
        await db.execute(

          '''
            CREATE TABLE categoria(
              id INTEGER PRIMARY KEY,
              nombre TEXT
            );
          '''

        );
      }
    );
  }

  Future<List<CategoriaModel>> getAllCategorias() async {
    final db = await database;
    final res = await db.query('categoria');
    return res.isNotEmpty
            ?res.map((categoria) => CategoriaModel.fromJson(categoria)).toList()
            :null;
  }

  Future<CategoriaModel> getCategoriaById(int id) async {
    final db = await database;
    final res = await db.query('categoria', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty
            ?CategoriaModel.fromJson(res.first)
            :null;
  }

  Future<int> crearCategoria(CategoriaModel categoria) async {
    final db = await database;
    final res = await db.insert('categoria', categoria.toJson());
    return res;
  }

  Future<int> borrarById(int id) async{
    final db = await database;
    final res = await db.delete('categoria', where: 'id = ?', whereArgs: [id]);
    return res;
  }



}