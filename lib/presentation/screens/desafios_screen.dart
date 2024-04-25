import 'package:flutter/material.dart';
import 'dart:math';

class DesafiosScreen extends StatefulWidget {
  const DesafiosScreen({Key? key}) : super(key: key);

  @override
  _RetosState createState() => _RetosState();
}

class _RetosState extends State<DesafiosScreen> {
  late int num1;
  late int num2;
  late int originalNum1;
  late int originalNum2;
  late String operador;
  late int correctAnswer;
  late int score;
  late List<int> opciones;
  late String difficulty;

  @override
  void initState() {
    super.initState();
    num1 = _generateRandomNumber();
    num2 = _generateRandomNumber();
    while (num1 == 0 || num2 == 0) {
      num1 = _generateRandomNumber();
      num2 = _generateRandomNumber();
    }
    originalNum1 = num1;
    originalNum2 = num2;
    operador = ['+', '-'][Random().nextInt(2)];
    correctAnswer = 0;
    score = 0;
    opciones = [];
    difficulty = 'facil';
    _obtenerOpciones();
  }

  int _generateRandomNumber() {
    return Random().nextInt(10) + 1;
  }

  int _calculateCorrectAnswer() {
    switch (operador) {
      case '+':
        return originalNum1 + originalNum2;
      case '-':
        return originalNum1 - originalNum2;
      default:
        return 0;
    }
  }

  void _obtenerOpciones() {
    final correct = _calculateCorrectAnswer();
    final opcionesIncorrectas = <int>[];
    while (opcionesIncorrectas.length < 3) {
      final incorrect = Random().nextInt(20) + 1;
      if (incorrect != correct && !opcionesIncorrectas.contains(incorrect)) {
        opcionesIncorrectas.add(incorrect);
      }
    }
    final opcionesList = [...opcionesIncorrectas, correct];
    opcionesList.shuffle();
    setState(() {
      opciones = opcionesList;
      correctAnswer = correct;
    });
  }

  void _checkAnswer(int opcion) {
    if (opcion == correctAnswer) {
      setState(() {
        score++;
      });
      _showAlert('¡Correcto!', 'Tu respuesta es correcta.');
    } else {
      _showAlert('Incorrecto', 'Tu respuesta es incorrecta. La respuesta correcta es $correctAnswer');
    }

    setState(() {
      originalNum1 = _generateRandomNumber();
      originalNum2 = _generateRandomNumber();
      while (originalNum1 == 0 || originalNum2 == 0) {
        originalNum1 = _generateRandomNumber();
        originalNum2 = _generateRandomNumber();
      }
      operador = ['+', '-'][Random().nextInt(2)];
      _obtenerOpciones();
    });
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget getFruitDisplay(String fruitType, int fruitCount) {
    return Text(
      fruitType == 'manzana' ? '🍎' * fruitCount : '🍐' * fruitCount,
      style: const TextStyle(fontSize: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafíos Matemáticos'),
        backgroundColor: const Color(0xFFC9D6EA),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tu puntaje: $score', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 150,
                  child: Text('🍎' * originalNum1, style: const TextStyle(fontSize: 25))
                ),
                const SizedBox(width: 5),
                Text(operador, style: const TextStyle(fontSize: 25)),
                const SizedBox(width: 5),
                SizedBox(
                  width: 100,
                  height: 150,
                  child: Text('🍎' * originalNum2, style: const TextStyle(fontSize: 25))
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 10,
                  children: opciones.sublist(0, 2).map((opcion) {
                    return ElevatedButton(
                      onPressed: () => _checkAnswer(opcion),
                      child: Text(
                        opcion.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 10,
                  children: opciones.sublist(2, 4).map((opcion) {
                    return ElevatedButton(
                      onPressed: () => _checkAnswer(opcion),
                      child: Text(
                        opcion.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
