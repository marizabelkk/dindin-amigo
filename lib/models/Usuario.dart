
import 'package:firebase_auth/firebase_auth.dart';

class Usuario {
  String? id;
  String nome;
  String email;
  String senha;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Usuario(this.nome, this.email, this.senha);

  Future<Map<String, dynamic>> criarConta() async {
    try {
      final contaCadastrada = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Salva o nome informado no cadastro no perfil do Firebase.
      await contaCadastrada.user?.updateDisplayName(nome);

      return {
        "criado": true,
        "conta": contaCadastrada,
        "msg": "Conta criada com sucesso",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "criado": false,
        "msg": "Erro: ${e.message}",
      };
    }
  }

  Future<Map<String, dynamic>> login() async {
    try {
      final credencial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      return {
        "logado": true,
        "usuario": credencial.user,
        "msg": "Login realizado com sucesso.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "logado": false,
        "usuario": null,
        "msg": e.message,
      };
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<Map<String, dynamic>> resetarSenha(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return {
        "enviado": true,
        "msg": "E-mail de redefinição enviado para $email.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "enviado": false,
        "msg": "Erro ao enviar e-mail: ${e.message}",
      };
    }
  }
}
