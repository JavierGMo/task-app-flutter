import 'dart:async';

import 'package:tasks/src/models/tarea_model.dart';

class TaskBloc{

  final _taskController = new StreamController<TareaModel>.broadcast();
  final _categoriesController = new StreamController<List<String>>.broadcast();
  final _btnController = new StreamController<bool>.broadcast();
  final tareaInit = TareaModel();

  TaskBloc(){
    tareaInit.titulo = '';
    tareaInit.descripcion = '';
    tareaInit.horai = '00:00';
    tareaInit.horaf = '00:00';
    this.agregarCampo(tareaInit);
  }

  //Streams
  Stream<TareaModel> get modelTask => this._taskController.stream;
  Stream<bool> get btnTask => this._btnController.stream;
  //Adds

  Function(TareaModel) get agregarCampo => this._taskController.add;
  Function(bool) get btnAddTask => this._btnController.add;

  void test(){
    
  }

  void dispose(){
    _taskController?.close();
    _btnController?.close();
    _categoriesController?.close();
  }


}