
import 'package:dindin_amigo/view_models/usuario_view_model.dart';
import 'package:dindin_amigo/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Exibe a tela de login', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => UsuarioViewModel(),
        child: const MaterialApp(
          home: LoginView(),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Não tem conta? Cadastre-se'), findsOneWidget);
    expect(find.text('Esqueci minha senha'), findsOneWidget);
  });
}
