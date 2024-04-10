// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provaplotze/view/lista.dart';
import 'package:provaplotze/view/listas.dart';
import 'package:provaplotze/view/login.dart';
import 'package:provaplotze/view/sobre.dart';
import 'view/criarConta.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

//
// MainApp
//
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      title: 'Navegação',

      //
      //Rotas de navegação
      //

      initialRoute: 'login',
      routes: {
        'login': (context) => PrincipalView(),
        'criar_conta': (context) => criarConta(),
        'lista': (context) => ListaAdd(),
        'allListas': (context) => showListas(),        
        'sobre' : (context) => SobreView(),
      },
      home: PrincipalView(),
    );
  }
}