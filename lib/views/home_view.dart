
import 'package:dindin_amigo/view_models/usuario_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UsuarioViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bem-vindo, ${viewModel.usuario?.nome ?? ''}!",
                ),
                SizedBox(height: 20),
                Text(
                  "Email: ${viewModel.usuario?.email ?? ''}",
                ),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.logout();

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Logout"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
