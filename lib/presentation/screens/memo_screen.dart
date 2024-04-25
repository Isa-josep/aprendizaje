import 'package:aprendizaje/presentation/widgets/menu_lat.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Memorama extends StatelessWidget {
  const Memorama({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 187, 255),
      ),
      body: const Center(
        
        child: MemoramaScreen(),
        
      ),
      drawer: SideMenu( scaffoldKey: scaffoldKey ),
    );
  }
}

class MemoramaScreen extends StatefulWidget {
  const MemoramaScreen({super.key});

  @override
  MemoramaScreenState createState() => MemoramaScreenState();
}

class MemoramaScreenState extends State<MemoramaScreen> {
  List<String> imagenes = [
    "🍔",
    "🦖",
    "🦈",
    "🦄",
    "🦜",
    "🥋",
  ];

  late List<String> _board;
  List<int> cardSeleccionada = [];
  List<int> cardEncontrada = [];
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _board = random([...imagenes, ...imagenes]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 41, 187, 255),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _gano() ? "Ganaste" : "Memorama",
              style: const TextStyle(fontSize: 35, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Text(
              "Puntuación: $_score",
              style: const TextStyle(fontSize: 35, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            // const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(12, (index) {
                String card = _board[index];
                bool volteada = cardSeleccionada.contains(index) || cardEncontrada.contains(index);
                return InkWell(
                  onTap: () => _nose(index),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFBEEED4),
                      border: Border.all(
                        color: volteada ? Colors.transparent : const Color(0xFF62E7A0),
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        volteada ? card : '?',
                        style: const TextStyle(fontSize: 46, color: Colors.black),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            if (_gano())
              ElevatedButton(
                onPressed: _resetGame,
                child: Text(
                  'Reiniciar',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  // primary: Color(0xFF9ECAD1),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _nose(int index) {
    if (cardSeleccionada.length >= 2 || cardSeleccionada.contains(index)) {
      return;
    }
    setState(() {
      cardSeleccionada.add(index);
      _score++;
    });
    if (cardSeleccionada.length == 2) {
      Future.delayed(Duration(milliseconds: 650), () {
        if (_board[cardSeleccionada[0]] == _board[cardSeleccionada[1]]) {
          setState(() {
            cardEncontrada.addAll(cardSeleccionada);
            cardSeleccionada.clear();
          });
        } else {
          setState(() {
            cardSeleccionada.clear();
          });
        }
      });
    }
  }

  bool _gano() {
    return cardEncontrada.length == _board.length;
  }

  void _resetGame() {
    setState(() {
      cardSeleccionada.clear();
      _score = 0;
      cardEncontrada.clear();
      _board = random([...imagenes, ...imagenes]);
    });
  }

  List<T> random<T>(List<T> array) {
    var random = Random();
    for (var i = array.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = array[i];
      array[i] = array[n];
      array[n] = temp;
    }
    return array;
  }
}
