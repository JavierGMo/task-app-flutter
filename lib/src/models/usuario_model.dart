import 'dart:convert';

UsuarioModel usuarioFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    UsuarioModel({
        this.id,
        this.nombre,
        this.apellido,
        this.ocupacionuno,
        this.ocupaciondos,
        this.refimagen,
    });

    int id;
    String nombre;
    String apellido;
    String ocupacionuno;
    String ocupaciondos;
    String refimagen;

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ocupacionuno: json["ocupacionuno"],
        ocupaciondos: json["ocupaciondos"],
        refimagen: json["refimagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "ocupacionuno": ocupacionuno,
        "ocupaciondos": ocupaciondos,
        "refimagen": refimagen,
    };
}
