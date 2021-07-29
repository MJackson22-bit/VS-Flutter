import 'package:flutter/material.dart';

final String tableUser = 'user';
class UserFields{
  static final List<String> values = [
    id, nombre, correo, passwd
  ];
  static final String id = "_id";
  static final String nombre = "nombre";
  static final String correo = "correo";
  static final String passwd = "passwd";
}

class User{
  final int? id;
  final String nombre;
  final String correo;
  final String passwd;

  const User({
    this.id,
    required this.nombre,
    required this.correo,
    required this.passwd
  });

  User copy({
    int? id,
    String? nombre,
    String? apellido,
    String? correo,
    String? passwd,
  }) =>
      User(
          nombre: nombre ?? this.nombre,
          correo: correo ?? this.correo,
          passwd: passwd ?? this.passwd
      );

  static User froomJson(Map<String, Object?> json) => User(
      id: json[UserFields.id] as int?,
      nombre: json[UserFields.nombre] as String,
      correo: json[UserFields.correo] as String,
      passwd: json[UserFields.passwd] as String
  );

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.nombre: nombre,
    UserFields.correo: correo,
    UserFields.passwd: passwd,
  };
}