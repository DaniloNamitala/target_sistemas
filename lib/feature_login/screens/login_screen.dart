import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:target_sistemas/feature_login/viewmodel/login_viewmodel.dart';
import 'package:target_sistemas/feature_login/widget/Input.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> openGoogle() async {
    final Uri url = Uri.parse('https://www.google.com/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
        color: Colors.grey[800],
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Input("Usuário", viewModel.userController),
              if (viewModel.userError.isNotEmpty)
                Text(viewModel.userError,
                    style: const TextStyle(color: Colors.red)),
              const Padding(padding: EdgeInsets.all(10.0)),
              Input(
                "Senha",
                viewModel.passwordController,
                isPassword: true,
              ),
              if (viewModel.passError.isNotEmpty)
                Text(viewModel.passError,
                    style: const TextStyle(color: Colors.red)),
              const Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                style: const ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size.fromHeight(50.0))),
                onPressed: () {
                  viewModel.login().then((value) => {
                        if (value) {goToHome(context)}
                      });
                },
                child: const Text("Entrar"),
              ),
              const Spacer(flex: 1),
              TextButton(
                onPressed: openGoogle,
                child: const Text("Política de privacidade",
                    style: TextStyle(color: Colors.white)),
              )
            ]),
      ),
    );
  }
}
