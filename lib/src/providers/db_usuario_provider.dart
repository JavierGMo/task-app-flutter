import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/src/models/usuario_model.dart';


class DBUsuarioProvider{

  static Database _database;
  static final DBUsuarioProvider db = DBUsuarioProvider._();
  
  DBUsuarioProvider._();

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
            CREATE TABLE usuario(
              id INTEGER PRIMARY KEY,
              nombre TEXT,
              apellido TEXT,
              ocupacionuno TEXT,
              ocupaciondos TEXT,
              refimagen TEXT
            );
          '''

        );
      }
    );
  }

  Future<List<UsuarioModel>> getAllUsuarios(int id) async{
    final db = await database;
    final res = await db.query('usuario', where: 'id != ?', whereArgs: [id]);
    return res.isNotEmpty?res.map((usuario) => UsuarioModel.fromJson(usuario)).toList():null;
  }

  Future<UsuarioModel> getUsuarioById(int id) async {
    final db = await database;
    final res = await db.query('usuario', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty?UsuarioModel.fromJson(res.first):null;
  }

  Future<int> createUsuario(UsuarioModel usuario) async {
    final db = await database;
    final res = await db.insert('usuario', usuario.toJson());

    return res;
  }

  Future<int> borrarById(int id) async{
    final db = await database;
    final res = await db.delete('usuario', where: 'id = ?', whereArgs: [id]);
    return res;
  }


}