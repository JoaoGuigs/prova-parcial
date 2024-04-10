class Lista {
  String nome;
  String qnt;

  Lista(this.nome, this.qnt);

  //geração de uma lista dinâmica de contatos
  static List<Lista> gerarLista() {
    List<Lista> lista = [];
    lista.add(Lista('Pao', '2'));
    lista.add(Lista('Arroz', '1'));

    

    return lista;

    
  }

  
}
