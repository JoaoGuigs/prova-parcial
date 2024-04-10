class Login{
  final String email;
  final String senha;

  Login(this.email, this.senha);
  
  static List<Login> gerarUsuarios(){
    List<Login> lista = [];
    for(int i = 1; i <= 1; i++){
      lista.add(Login('admin', 'admin'));
      lista.add(Login('Joao', 'Joao'));
    }
    return lista;
  }
}
