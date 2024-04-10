//
// PrincipalView
//
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/login.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //Chave para o formulário
  var formKey = GlobalKey<FormState>();
  var status = false;

  //Controladores para os Campos de Texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(context, titulo, mensagem) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'cancelar'),
            child: Text('cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'ok'),
            child: Text('ok'),
          ),
        ],
      ),
    );
  }

  List<Login> lista = [];

  @override
  void initState() {
    lista = Login.gerarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: SingleChildScrollView(
          //Direção da barra de rolagem
          scrollDirection: Axis.vertical,

          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //
                // Ícone
                //
                Icon(
                  Icons.logout_outlined,
                  size: 120,
                  color: Colors.blue.shade900,
                ),

                //
                // IMAGEM
                //
                /*Image.asset(
                  'lib/imagens/img1.jpg',
                  width: 200,
                  height: 200,
                ),*/
                Image.network(
                    'https://magazine25.vteximg.com.br/arquivos/ids/189732-1250-1250/Lettering-Transfer-para-Balao-Bem-Vindo-Preto-Parabens-22X18-cm----1-Unidade.jpg?v=637366580225570000'),

                Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 18),
                TextFormField(
                  controller: txtValor1,

                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),

                  //
                  // Validação
                  //
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um valor de email';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 30),

                Text(
                  'Senha:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 18),
                TextFormField(
                  controller: txtValor2,

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),

                  //
                  // Validação
                  //
                  validator: (value) {
                    if (value == null) {
                      return 'Informe sua senha';
                    } else if (value.isEmpty) {
                      return 'Informe sua senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                //ElevatedButton
                //TextButton
                //OutlinedButton
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    //
                    // Executar o processo de VALIDAÇÃO
                    //
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        for (int i = 0; i < lista.length; i++) {
                          if (txtValor1.text == lista[i].email &&
                              txtValor2.text == lista[i].senha) {
                            String nome = 'Joao';
                            Navigator.pushNamed(context, 'allListas',
                                arguments: nome);
                          } else {
                            //Erro na Validação
                          }
                        }
                      });
                    }
                  },
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 36),
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(100, 50),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'criar_conta',
                            arguments: lista);
                        //
                        // Executar o processo de VALIDAÇÃO
                        //

                        //Validação com sucesso

                        //
                        // Recuperar as informações contidas nos
                        // Campos de texto
                        //
                        //setState(() {
                        //var msg = "Sera redirecionado para Criar Conta";
                        //caixaDialogo(context, 'Título', msg);
                        // });

                        //Erro na Validação
                      },
                      child: Text(
                        'Criar Conta',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(width: 30),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        //
                        // Executar o processo de VALIDAÇÃO
                        //

                        //Validação com sucesso

                        //
                        // Recuperar as informações contidas nos
                        // Campos de texto
                        //
                        setState(() {
                          var msg = "Sera redirecionado para mudar Senha";
                          caixaDialogo(context, 'Título', msg);
                        });

                        //Erro na Validação
                      },
                      child: Text(
                        'Recuperar Senha',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                Switch(
                  value: status,
                  onChanged: (bool value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),

                SizedBox(height: 20), // Espaçamento adicional
                // Botão "Sobre"
                TextButton(
                  onPressed: () {
                    // Navegar para outra view ao clicar em "Sobre"
                    Navigator.pushNamed(context, 'sobre');
                  },
                  child: Text('Sobre '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
