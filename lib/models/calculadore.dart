import 'dart:math';
import 'package:calculadoraimcapp/models/imc.dart';

class Calculadora {
  int _index = -1;
  double _resultado = 0.0;
  List<Imc> _listIMC = [
    Imc(
        descripcion: "Bajo",
        recomendaciones:
            "IMC es menos de 18.5, se encuentra dentro del rango de peso insuficiente",
        valorMinimo: 0,
        valorMaximo: 18.5),
    Imc(
        descripcion: "Normal",
        recomendaciones:
            "IMC es entre 18.5 y 24.9, se encuentra dentro del rango de peso normal o saludable",
        valorMinimo: 18.6,
        valorMaximo: 25),
    Imc(
        descripcion: "Sobrepeso",
        recomendaciones:
            "IMC es entre 25.0 y 29.9, se encuentra dentro del rango de sobrepeso",
        valorMinimo: 25,
        valorMaximo: 30),
    Imc(
        descripcion: "Obesidad I",
        recomendaciones:
            "IMC es 30.0 o superior, se encuentra dentro del rango de obesidad I",
        valorMinimo: 30.0,
        valorMaximo: 35.0),
    Imc(
        descripcion: "Obesidad II",
        recomendaciones:
            "IMC es 34.9 o superior, se encuentra dentro del rango de obesidad II",
        valorMinimo: 35.0,
        valorMaximo: 40.0),
    Imc(
        descripcion: "Obesidad III",
        recomendaciones:
            "IMC es 39.9 o superior, se encuentra dentro del rango de obesidad III",
        valorMinimo: 39.9,
        valorMaximo: 100),
  ];
  calcularIMC(double altura, double peso) {
    _resultado = peso / pow((altura / 100), 2);
    _index = _listIMC.indexWhere((element) =>
        (element.valorMinimo <= _resultado &&
            _resultado < element.valorMaximo));
  }

  String getDescripcion() {
    return _index >= 0 ? _listIMC[_index].descripcion : "";
  }

  String getREcomendaciones() {
    return _index >= 0 ? _listIMC[_index].recomendaciones : "";
  }

  double getResultado() {
    return _resultado;
  }
}
