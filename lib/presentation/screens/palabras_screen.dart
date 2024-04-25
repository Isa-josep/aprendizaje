import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Palabras extends StatefulWidget {
  const Palabras({Key? key}) : super(key: key);

  @override
  _PalabrasState createState() => _PalabrasState();
}

class _PalabrasState extends State<Palabras> {
  final List<String> palabras = [
    "Casa",
    "Perro",
    "Gato",
    "Libro",
    "Jardín",
    // Aquí van todas las palabras...
  ];

  final List<String> oraciones = [
    "La casa es grande y acogedora.",
    "El perro juega en el jardín.",
    "Me gusta leer un libro en la escuela.",
    "El sol brilla en el cielo azul.",
    // Aquí van todas las oraciones...
  ];

  late FlutterTts flutterTts;
  String difficulty = 'facil';
  String generatedText = '';

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  String getRandomWord() {
    final int randomIndex = DateTime.now().millisecondsSinceEpoch % palabras.length;
    return palabras[randomIndex];
  }

  String getRandomSentence() {
    final int randomIndex = DateTime.now().millisecondsSinceEpoch % oraciones.length;
    return oraciones[randomIndex];
  }

  Future<void> speak() async {
    String thingToSay = '';
    if (difficulty == 'facil') {
      thingToSay = getRandomWord();
    } else {
      thingToSay = getRandomSentence();
    }

    setState(() {
      generatedText = thingToSay;
    });

    await flutterTts.setLanguage('es');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(.9);
    await flutterTts.speak(thingToSay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9D6EA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Desafíos Oraciones',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 30),
            Text(
              difficulty == 'facil' ? 'Palabra generada:' : 'Oración generada:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              generatedText,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: difficulty,
              onChanged: (value) {
                setState(() {
                  difficulty = value!;
                });
              },
              items: <String>['facil', 'dificil'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: speak,
              child: Icon(Icons.volume_up),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
