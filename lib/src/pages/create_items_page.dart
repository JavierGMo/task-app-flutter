import 'package:flutter/material.dart';
import 'package:tasks/src/models/usuario_model.dart';
import 'package:tasks/src/utils/crear_algo.dart';

class CreateItemsPage extends StatefulWidget {
  

  @override
  _CreateItemsPageState createState() => _CreateItemsPageState();
}

class _CreateItemsPageState extends State<CreateItemsPage> {

  String nombreUsuario = '';
  String apellido = '';
  String ocupacionUno = '';
  String ocupacionDos = '';
  String refImagen = '';

  UsuarioModel usuario = UsuarioModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear cosas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _crearUsuario(),
              _botonCrear('Crear categorias', crearCategorias),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearUsuario(){
    return Container(
      child: Column(
        children: [
          _campoGeneral('Nombre de usuario', (String nombre){this.nombreUsuario = nombre;}),
          _campoGeneral('Apellido', (String apellido){this.apellido = apellido;}),
          _campoGeneral('Ocupacion uno', (String ocupacionUno){this.ocupacionUno = ocupacionUno;}),
          _campoGeneral('Ocupacion uno', (String ocupacionDos){this.ocupacionDos = ocupacionDos;}),
          _campoGeneral('Ref imagen', (String refImagen){this.refImagen = refImagen;}),
          _botonCrear('Crear usuario', (){
            usuario.nombre = this.nombreUsuario;
            usuario.apellido = this.apellido;
            usuario.ocupacionuno = this.ocupacionUno;
            usuario.ocupaciondos = this.ocupacionDos;
            usuario.refimagen = this.refImagen;
            print('Agergado a la base de datis');
            setState(() {
              this.nombreUsuario = '';
              this.apellido = '';
              this.ocupacionUno = '';
              this.ocupacionDos = '';
              this.refImagen = '';
            });
          }),


        ],
      ),
    );
  }

  

  Widget _campoGeneral(String label, Function funcion){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: '$label',
          hintText: '$label'
        ),
        onChanged: (String value){
          funcion(value);
        },
      ),
    );
  }

  Widget _botonCrear(String nombreBoton, Function funcion){
    return Container(
      child: FlatButton(
        child: Text('$nombreBoton'),
        color: Colors.pinkAccent,
        onPressed: (){
          funcion();
        },
      ),
    );
  }


  


}