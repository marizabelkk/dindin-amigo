# 💰 Dindim Amigo

Aplicativo desenvolvido em **Flutter** com integração ao **Firebase**, como projeto de desenvolvimento de software.

## 📌 Sobre o projeto

O **Dindim Amigo** é um projeto que utiliza Flutter para a construção da interface e Firebase para os recursos de autenticação de usuários.

Atualmente, o aplicativo conta com funcionalidades de cadastro de conta, login e recuperação de senha, utilizando o Firebase Authentication.

## 🚀 Tecnologias utilizadas

- **Flutter** — desenvolvimento da interface do aplicativo.
- **Dart** — linguagem de programação.
- **Firebase Authentication** — autenticação de usuários.
- **Cloud Firestore** — serviço de banco de dados integrado ao Firebase.
- **Firebase Storage** — serviço de armazenamento de arquivos.
- **Provider** — gerenciamento de estado da aplicação.

## ✨ Funcionalidades implementadas

- Cadastro de usuários com nome, e-mail e senha.
- Login com e-mail e senha.
- Recuperação de senha por e-mail.
- Exibição de informações do usuário autenticado.
- Logout.
- Integração com Firebase.

## 🏗️ Organização do projeto

O projeto utiliza uma organização baseada no padrão **MVVM (Model-View-ViewModel)**.

```text
lib/
├── models/
│   └── Usuario.dart
├── view_models/
│   └── usuario_view_model.dart
├── views/
│   ├── home_view.dart
│   ├── login_view.dart
│   ├── cadastro_view.dart
│   └── reset_senha_view.dart
├── firebase_options.dart
└── main.dart

assets/
└── logologin.png

test/
└── widget_test.dart
```

## ⚙️ Como executar o projeto

### Pré-requisitos

- Flutter instalado.
- Dart SDK compatível com a versão do projeto.
- Uma conta Google para configurar o Firebase.
- Um projeto configurado no Firebase Console.

### 1. Clone o repositório

```bash
git clone URL_DO_REPOSITORIO
```

Substitua `URL_DO_REPOSITORIO` pelo endereço do repositório no GitHub.

### 2. Entre na pasta do projeto

```bash
cd dindin-amigo
```

### 3. Instale as dependências

```bash
flutter pub get
```

### 4. Configure o Firebase

Configure um projeto no Firebase Console e associe as plataformas desejadas ao aplicativo Flutter utilizando o FlutterFire CLI.

O arquivo `firebase_options.dart` contém as configurações utilizadas para inicializar o Firebase. Por segurança, não publique credenciais privadas ou arquivos com chaves secretas.

### 5. Execute o aplicativo

```bash
flutter run
```

## 🧪 Testes

Para executar os testes automatizados do projeto, utilize:

```bash
flutter test
```

## 📚 Objetivo

Este projeto tem como objetivo aplicar conhecimentos de desenvolvimento com Flutter e Dart, integração com serviços Firebase, autenticação de usuários e organização de código.

## 👩‍💻 Autoria

Desenvolvido como projeto acadêmico.