import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:target_sistemas/feature_home/screens/home_screen.dart';
import 'package:target_sistemas/feature_login/repository/login_repository.dart';
import 'package:target_sistemas/feature_login/screens/login_screen.dart';
import 'package:target_sistemas/feature_login/viewmodel/login_viewmodel.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  LoginViewModel(loginRepository: LoginRepository())),
        ],
        child: MaterialApp(
            title: 'Target Sistemas',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            routes: {
              '/': (context) => const LoginScreen(),
              '/home': (context) => const HomeScreen()
            }));
  }
}
