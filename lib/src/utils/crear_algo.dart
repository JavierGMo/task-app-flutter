import 'package:tasks/src/providers/db_categoria_provider.dart';
import 'package:tasks/src/models/categoria_model.dart';


void crearCategorias() {
  final categorias = [
    'videojuegos',
    'ux/ui',
    'desing',
    'web',
    'programar',
    'cotizar'
  ];
  for (int i = 0; i < 6; i++) {
    final categoria = CategoriaModel();
    categoria.nombre = categorias[i];
    DBCategoriaProvider.db.crearCategoria(categoria);
  }
  // DBCategoriaProvider.db.crearCategoria(categoria);
}