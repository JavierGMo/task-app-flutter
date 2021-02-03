import 'dart:convert';

CategoriaModel categoriaFromJson(String str) => CategoriaModel.fromJson(json.decode(str));

String categoriaToJson(CategoriaModel data) => json.encode(data.toJson());

class CategoriaModel {
    CategoriaModel({
        this.id,
        this.nombre,
    });

    int id;
    String nombre;

    factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
