import 'package:calculadoraimcapp/models/calculadore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculadorImcPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CalculadorImcPage extends StatefulWidget {
  @override
  _CalculadorImcPage createState() => _CalculadorImcPage();
}

class _CalculadorImcPage extends State<CalculadorImcPage> {
  double altura = 100, peso = 31;

  Calculadora calculadora = Calculadora();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calcular IMC",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 20,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Altura:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "$altura cm.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  child: Slider(
                    min: 100.0,
                    max: 200.0,
                    value: altura,
                    onChanged: (double value) => setState(() {
                      altura = double.parse(value.toStringAsFixed(2));
                    }),
                  ),
                ),
                Text(
                  "Peso:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "$peso kg.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  child: Slider(
                    min: 29.0,
                    max: 200.0,
                    value: peso,
                    onChanged: (double value) => setState(() {
                      peso = double.parse(value.toStringAsFixed(2));
                    }),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MaterialButton(
                        height: 48,
                        onPressed: () => setState(() {
                          calculadora.calcularIMC(altura, peso);
                        }),
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(calculadora.getREcomendaciones()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
