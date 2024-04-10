import 'package:flutter/material.dart';
import 'package:provaplotze/model/login.dart';

class criarConta extends StatefulWidget {
  const criarConta({super.key});

  @override
  State<criarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<criarConta> {
  late List<Login> login;

  @override
  void initState() {
    login = Login.gerarUsuarios();
    super.initState();
  }

  var formKey = GlobalKey<FormState>();
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar sua Conta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Digite o seu email:",
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe um valor de email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              Text(
                "Digite a sua senha:",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                controller: txtValor2,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              OutlinedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      login.add(Login(txtValor1.text, txtValor2.text));
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Criar conta'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
