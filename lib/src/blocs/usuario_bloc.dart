
import 'dart:async';

import 'package:tasks/src/models/usuario_model.dart';

class UsuarioBloc{

  final _usuarioController = StreamController<UsuarioModel>.broadcast();
  
  UsuarioBloc(){
    //
  }

  void dispose(){
    _usuarioController?.close();
  }



}