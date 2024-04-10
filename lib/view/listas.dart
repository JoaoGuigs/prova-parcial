

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provaplotze/model/lista.dart';
import 'package:provaplotze/model/listas.dart';

class showListas extends StatefulWidget {
  const showListas({super.key});
  @override
  State<showListas> createState() => _ShowListasState();
}

class _ShowListasState extends State<showListas> {
  List<Listas> listasCriadas = [];
  TextEditingController _ListaControler = TextEditingController();

  @override
  void initState() {
    listasCriadas.add(Listas("Lista para comprar"));

    listasCriadas[0].adicionarProduto("Aveia", '4');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listasCriadas.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.traffic_rounded),
                title: Text('${listasCriadas[index].getNome()}'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "lista",);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mostrar um AlertDialog com um TextFormField
          showDialog(
            context: context,
            builder: (context,) {
              return AlertDialog(
                title: Text('Adicionar nova Lista'),
                content: TextFormField(
                  controller: _ListaControler,
                  decoration: InputDecoration(hintText: 'Digite o nome'),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        String produto = _ListaControler.text;
                        listasCriadas.add(Listas(produto));
                       // listasCriadas[].adicionarProduto('arroz', '2');
                        Navigator.of(context).pop(); // Fechar o AlertDialog

                      });

                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
} 