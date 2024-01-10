import 'dart:math';
import 'package:calculadoraimcapp/models/imc.dart';

class Calculadora {
  int _index = -1;
  double _resultado = 0.0;
  List<Imc> _listIMC = [
    Imc(
        descripcion: "severethinness",
        recomendaciones:
            "IMC es menos de 16, se encuentra dentro del rango de peso insuficiente severo",
        valorMinimo: 1,
        valorMaximo: 16.0),
    Imc(
        descripcion: "moderatethinness",
        recomendaciones:
            "IMC esta entre 16 - 17, se encuentra dentro del rango de peso insuficiente moderadamente",
        valorMinimo: 16,
        valorMaximo: 17.0),
    Imc(
        descripcion: "moderatethinness",
        recomendaciones:
            "IMC esta entre 17 - 18.5, se encuentra dentro del rango de peso insuficiente levemente",
        valorMinimo: 17,
        valorMaximo: 18.6),
    Imc(
        descripcion: "normal",
        recomendaciones:
            "IMC es entre 18.5 - 25, se encuentra dentro del rango de peso normal o saludable",
        valorMinimo: 18.5,
        valorMaximo: 25.0),
    Imc(
        descripcion: "overweight",
        recomendaciones:
            "IMC es entre 25 - 30, se encuentra dentro del rango de sobrepeso",
        valorMinimo: 25,
        valorMaximo: 30.0),
    Imc(
        descripcion: "obeseI",
        recomendaciones:
            "IMC es 30 - 35, se encuentra dentro del rango de Obesidad I",
        valorMinimo: 30.0,
        valorMaximo: 35.0),
    Imc(
        descripcion: "obeseII",
        recomendaciones:
            "IMC es 35 - 40, se encuentra dentro del rango de obesidad II",
        valorMinimo: 35.0,
        valorMaximo: 40.0),
    Imc(
        descripcion: "obeseIII",
        recomendaciones:
            "IMC es 40 o superior, se encuentra dentro del rango de Obesidad III",
        valorMinimo: 40,
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
