// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Este foi um aplicativo feita para a prova parcial ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
