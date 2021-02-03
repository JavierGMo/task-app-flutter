import 'dart:convert';

TareaModel tareaFromJson(String str) => TareaModel.fromJson(json.decode(str));

String tareaToJson(TareaModel data) => json.encode(data.toJson());

class TareaModel {
    TareaModel({
        this.id,
        this.titulo,
        this.descripcion,
        this.fecha,
        this.horai,
        this.horaf,
        this.idusuario,
        this.idcategoria,
    });

    int id;
    String titulo;
    String descripcion;
    String fecha;
    String horai;
    String horaf;
    int idusuario;
    int idcategoria;

    factory TareaModel.fromJson(Map<String, dynamic> json) => TareaModel(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        horai: json["horai"],
        horaf: json["horaf"],
        idusuario: json["idusuario"],
        idcategoria: json["idcategoria"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "fecha": fecha,
        "horai": horai,
        "horaf": horaf,
        "idusuario": idusuario,
        "idcategoria": idcategoria,
    };
}
