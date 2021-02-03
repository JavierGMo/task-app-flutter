import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/src/models/tarea_model.dart';


class DBTaskProvider{

  static Database _database;
  static final DBTaskProvider db = DBTaskProvider._();
  
  DBTaskProvider._();

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
            CREATE TABLE task(
              id INTEGER PRIMARY KEY,
              titulo TEXT,
              descripcion TEXT,
              fechas TEXT,
              horai TEXT,
              horaf TEXT,
              FOREIGN KEY(idcategoria) REFERENCES categoria(id),
              FOREIGN KEY(idusuario) REFERENCES usuario(id)
            );
          '''

        );
      }
    );
  }//Iniciar la base de datos

  Future<int> nuevoTask(TareaModel usuario) async {
    final db = await database;
    final res = await db.insert('tast', usuario.toJson());
    return res;
  }

  Future<TareaModel> getTaskById(int id) async {
    final db = await database;
    final res = await db.query('task');
    return res.isNotEmpty?TareaModel.fromJson(res.first):null;
  }

  Future<List<TareaModel>> getAllTask() async{
    final db = await database;
    final res = await db.query('task');
    return res.isNotEmpty
            ?res.map((tarea) => TareaModel.fromJson(tarea)).toList()
            :null;
  }
  Future<int> borrarTodos() async {
    final db = await database;
    final res = await db.delete('task');
    return res;
  }



}