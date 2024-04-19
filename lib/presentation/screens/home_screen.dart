import 'package:flutter/material.dart';
import 'package:aprendizaje/presentation/widgets/menu_lat.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Aprendizaje'),
      ),
      body: const _Home(),
      drawer: SideMenu( scaffoldKey: scaffoldKey )
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}

