import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Incio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
       
            context.push('/h');
          },
          child: Text('Button'),
        ),
      ),
    );
  }
}