import 'package:dindin_amigo/view_models/usuario_view_model.dart';
import 'package:dindin_amigo/views/cadastro_view.dart';
import 'package:dindin_amigo/views/home_view.dart';
import 'package:dindin_amigo/views/reset_senha_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Image(
              height: 100,
              width: 100,
              image: AssetImage("assets/logologin.png"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Consumer<UsuarioViewModel>(
              builder: (context, viewModel, child) {
                return ElevatedButton(
                  onPressed: () async {
                    var user = await viewModel.login(
                      emailController.text,
                      senhaController.text,
                    );

                    if (user != false && user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            viewModel.msgTelaLogin.toString(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CadastroView();
                  },
                );
              },
              child: Text("Não tem conta? Cadastre-se"),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ResetSenhaView();
                  },
                );
              },
              child: Text("Esqueci minha senha"),
            ),
          ],
        ),
      ),
    );
  }
}