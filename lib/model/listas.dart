import 'package:provaplotze/model/lista.dart';

class Listas {
  final String nomeDaLista;
  
  List<Lista> produtos = [];

  Listas(this.nomeDaLista);

  getNome() {
    return nomeDaLista;
  }

  adicionarProduto(nome, qtd) {
    produtos.add(Lista(nome, qtd));
  }
}
