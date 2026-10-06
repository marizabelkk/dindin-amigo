
import 'package:dindin_amigo/models/Usuario.dart';
import 'package:flutter/material.dart';

class UsuarioViewModel extends ChangeNotifier {
  final String _usuarioId = "";
  String get usuarioId => _usuarioId;

  String _msgTelaLogin = "";
  String get msgTelaLogin => _msgTelaLogin;

  Usuario? usuario;

  Future<bool> cadastrarUsuario(
      String nome, String email, String senha) async {
    usuario = Usuario(nome, email, senha);

    final resultado = await usuario!.criarConta();

    _msgTelaLogin = resultado["msg"];
    notifyListeners();

    return resultado["criado"] == true;
  }

  Future<dynamic> login(String email, String senha) async {
    usuario = Usuario("", email, senha);

    final resultado = await usuario!.login();

    if (resultado["logado"] == true) {
      final usuarioLogado = resultado["usuario"];

      usuario!.id = usuarioLogado.uid;
      usuario!.nome = usuarioLogado.displayName ?? "";
      usuario!.email = usuarioLogado.email ?? "";

      _msgTelaLogin = resultado["msg"];
      notifyListeners();

      return usuarioLogado;
    } else {
      _msgTelaLogin = resultado["msg"];
      notifyListeners();

      return false;
    }
  }

  Future<void> logout() async {
    if (usuario != null) {
      await usuario!.logout();
      usuario = null;
      notifyListeners();
    }
  }

  Future<bool> resetarSenha(String email) async {
    Usuario usuario = Usuario("", email, "");

    final resultado = await usuario.resetarSenha(email);

    _msgTelaLogin = resultado["msg"];
    notifyListeners();

    return resultado["enviado"] == true;
  }
}
