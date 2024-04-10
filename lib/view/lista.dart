import 'package:flutter/material.dart';
import 'package:provaplotze/model/lista.dart';

class ListaAdd extends StatefulWidget {
  const ListaAdd({Key? key}) : super(key: key);

  @override
  State<ListaAdd> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<ListaAdd> {
  late List<Lista> lista;
  bool isEditing = false;
  TextEditingController editingController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<bool> checkedItems = List<bool>.generate(10, (index) => false);

  @override
  void initState() {
    lista = Lista.gerarLista();
    super.initState();
  }

  var txtLista = TextEditingController();
  var txtQnt = TextEditingController();
  var NewtxtQnt = TextEditingController();
  var NewtxtLista = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Pesquisar Produto'),
                    content: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Produto',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _searchItem(searchController.text);
                        },
                        child: Text('Pesquisar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              " Digite Compras:",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18),
            TextFormField(
              controller: txtLista,
              decoration: InputDecoration(
                labelText: 'Compras',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: txtQnt,
              decoration: InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(200, 60),
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow,
              ),
              onPressed: () {
                setState(() {
                  lista.add(Lista(txtLista.text, txtQnt.text));
                });
              },
              child: Text(
                'Adicionar ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue.shade50,
                    child: ListTile(
                      leading: Checkbox(
                        value: checkedItems[index],
                        onChanged: (value) {
                          setState(() {
                            checkedItems[index] = value!;
                          });
                        },
                      ),
                      title: isEditing
                          ? TextField(controller: editingController)
                          : Text(lista[index].nome),
                      subtitle: Text(lista[index].qnt),
                      trailing: IconButton(
                        icon: Icon(isEditing ? Icons.save : Icons.edit),
                        onPressed: () {
                          setState(() {
                            if (isEditing) {
                              lista[index].nome = editingController.text;
                            }
                            isEditing = !isEditing;
                          });
                        },
                      ),
                      hoverColor: Colors.red.shade50,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(lista[index].nome)),
                        );
                      },
                      onLongPress: () {
                        setState(() {
                          lista.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchItem(String itemName) {
    setState(() {
      lista.clear();
      for (var item in Lista.gerarLista()) {
        if (item.nome.toLowerCase().contains(itemName.toLowerCase())) {
          lista.add(item);
        }
      }
    });
  }
}
