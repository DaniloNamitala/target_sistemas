import 'package:flutter/material.dart';
import 'package:target_sistemas/feature_login/repository/login_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository loginRepository;

  bool isLoggedIn = false;
  String userError = "";
  String passError = "";

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel({required this.loginRepository});

  init() async {
    await _refreshState();
  }

  String _errorPassword() {
    passwordController.text = passwordController.text.trim();
    String password = passwordController.text.trim();
    if (password.length < 2) {
      return "Semnha deve ter no mínimo 2 caracteres";
    } else if (password.length > 20) {
      return "Senha deve ter no máximo 20 caracteres";
    } else if (!RegExp(r'[a-z|A-Z|0-9]+$').hasMatch(password)) {
      return "Senha não pode conter caracteres especiais";
    }
    return "";
  }

  String _errorUser() {
    userController.text = userController.text.trim();
    String username = userController.text.trim();
    if (username.length < 2) {
      return "Usuário deve ter no mínimo 2 caracteres";
    } else if (username.length > 20) {
      return "Usuário deve ter no máximo 20 caracteres";
    }
    return "";
  }

  _refreshState() async {
    notifyListeners();
  }

  Future<bool> _validateLogin(String user, String pass) async {
    bool result = await loginRepository.login(user, pass);
    if (!result) {
      passError = "Usuário ou senha inválidos";
      await _refreshState();
    }
    return result;
  }

  Future<bool> login() async {
    userError = _errorUser();
    passError = _errorPassword();
    await _refreshState();
    if (userError.isNotEmpty || passError.isNotEmpty) {
      return Future(() => false);
    }
    return _validateLogin(userController.text, passwordController.text);
  }
}
