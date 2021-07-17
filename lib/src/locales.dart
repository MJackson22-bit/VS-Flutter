import 'dart:ui';

import 'package:flutter/material.dart';
class Local{
  String nombre;
  Color color;
  String image;
  Local(this.nombre, this.color, this.image);

  static List<Local> locales(){
    return [Local("Restaurantes", Colors.white, "assets/restaurante-tip-top.jpg"),
      Local("Fritangas", Colors.white, "assets/fitangas.jpg"),
      Local("Bares", Colors.white, "assets/bares.jpg"),
      Local("Centros de diversión", Colors.white, "assets/centrodiversion.jpg")
    ];
  }
}